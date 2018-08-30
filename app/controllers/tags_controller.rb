class TagsController < ApplicationController
  before_action :set_tag, only: %i[show edit update destroy]
  before_action :set_tags, only: [:show]
  before_action :authenticate_admin_user!, only: %i[new edit create update destroy]
  before_action :set_search, only: %i[show new edit]

  MAX_WEEKLY_RANKING = 5
  MAX_LIKES_RANKING = 5

  def show
    @products = @tag.products.published.includes(:tags).page(params[:page])
    @weekly_ranking = Product.published.created_after(1.week.ago).like_ranking(MAX_WEEKLY_RANKING)
    @product_ranking = Product.published.joins(:tags).where(tags: { id: params[:id] }).like_ranking(MAX_LIKES_RANKING)
    @recommended_products = Product.published.joins(:tags).where(tags: { id: params[:id] }).random(5)
  end

  def edit
  end

  def update
    respond_to do |format|
      if @tag.update(tag_params)
        format.html { redirect_to @tag, notice: "Tag was successfully updated." }
        format.json { render :show, status: :ok, location: @tag }
      else
        format.html { render :edit }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tag.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: "タグを削除しました" }
      format.json { head :no_content }
    end
  end

  private

    def set_tag
      @tag = Tag.find(params[:id])
    end

    def set_tags
      @tags = Tag.all
    end

    def tag_params
      params.require(:tag).permit(:label)
    end

    def set_search
      @search = Product.includes(:tags).ransack(params[:q])
    end
end
