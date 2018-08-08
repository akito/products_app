class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin_user!, only: [:edit, :update, :destroy]
  before_action :correct_product, only: [:show]
  before_action :set_search, :set_category, only: [:index, :show, :new, :edit]

  # GET /products
  # GET /products.json
  def index
    @products = @search.result.published.includes(:product_tags, :tags).order(:id).page(params[:page])
    @categories = Category.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @products = Product.published.order(:id)
    @comments = @product.comments.includes(:user)
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    @product.add_tags(product_tags_param[:tags_to_s].split) unless product_tags_param[:tags_to_s].nil?
    respond_to do |format|
      if @product.save
        format.html { redirect_to root_path, notice: 'プロダクトは正しく申請されました' }
        format.json { render :show, status: :created, location: root_path }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    @product.add_tags(product_tags_param[:tags_to_s].split) unless product_tags_param[:tags_to_s].nil?
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'プロダクト情報は更新されました' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'プロダクトは削除されました' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :url, :desc, :image, :thumbnail, :status)
    end

    def product_tags_param
      params.require(:product).permit(:name, :url, :desc, :image, :thumbnail, :tags_to_s)
    end

    def correct_product
      unless set_product.published?
        raise Forbidden, '権限がありません' unless current_user&.admin?
      end
    end

    def set_search
      @search = Product.ransack(params[:q])
    end

    def set_category
      @categories = Category.all
    end
end
