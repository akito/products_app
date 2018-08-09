class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]
  before_action :set_tags, only: [:show]
  before_action :authenticate_admin_user!, only: [:new, :edit, :create, :update, :destroy ]
  before_action :set_search, only: [:show, :new, :edit]

  MAX_WEEKLY_RANKING = 5
  MAX_LIKES_RANKING = 5

  # # GET /categories/1
  # # GET /categories/1.json
  def show
    @products = @tag.products.includes(:tags).page(params[:page])
    @weekly_ranking = Product.created_after(1.week.ago).like_ranking(MAX_WEEKLY_RANKING)
    @product_ranking = Product.joins(:tags).where(tags: { id: params[:page] }).like_ranking(MAX_LIKES_RANKING)
  end
  #
  # # GET /categories/new
  # def new
  #   @category = Category.new
  # end
  #
  # GET /categories/1/edit
  def edit
  end
  #
  # # POST /categories
  # # POST /categories.json
  # def create
  #   @category = Category.new(category_params)
  #
  #   respond_to do |format|
  #     if @category.save
  #       format.html { redirect_to @category, notice: 'Category was successfully created.' }
  #       format.json { render :show, status: :created, location: @category }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @category.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  #
  # # PATCH/PUT /categories/1
  # # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @tag.update(tag_params)
        format.html { redirect_to @tag, notice: 'Tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @tag }
      else
        format.html { render :edit }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end
  #
  # # DELETE /categories/1
  # # DELETE /categories/1.json
  # def destroy
  #   @category.destroy
  #   respond_to do |format|
  #     format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end
  #
  # private
  # # Use callbacks to share common setup or constraints between actions.
  def set_tag
    @tag = Tag.find(params[:id])
  end
  #
  def set_tags
    @tags = Tag.all
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def tag_params
    params.require(:tag).permit(:label)
  end

  def set_search
    @search = Product.includes(:tags).ransack(params[:q])
  end
end
