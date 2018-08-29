class NewsController < ApplicationController
  before_action :set_new, only: [:destroy]
  before_action :authenticate_admin_user!, only: %i[create destroy]

  # POST /products
  # POST /products.json
  def create
    @new = New.new(new_params)
    page = MetaInspector.new(@new.url)
    @new.title = page.best_title || page.best_title || nil
    @new.media = nil
    @new.image = page.images.best || page.meta_tags["property"]["og:image"] || nil
    @new.description = page.best_description || page.description || nil

    if @new.save
      redirect_to product_path(@new.product_id), notice: "ニュースを追加しました"
    else
      redirect_to product_path(@new.product_id), notice: "ニュースを追加できませんでした"
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @new.destroy
    redirect_to product_path(@product), notice: "ニュースを削除しました"
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_new
      @new = New.find(params[:id])
      @product = Product.find(params[:product_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def new_params
      params.require(:new).permit(:url, :product_id)
    end
end
