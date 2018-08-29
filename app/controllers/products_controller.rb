class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy, :fetch]
  before_action :correct_product, only: [:show]
  before_action :authenticate_admin_user!, only: [:edit, :update, :destroy, :fetch]
  before_action :set_search, :set_category, only: [:index, :show, :new, :edit]
  before_action :product_ranking, only: [:index, :show]

  MAX_WEEKLY_RANKING = 5
  MAX_RELATED_PRODUCTS = 5
  MAX_LIKES_RANKING = 5

  # GET /products
  # GET /products.json
  def index
    @products = @search.result.published.order(updated_at: :DESC).page(params[:page])
    @categories = Category.all
    @weekly_ranking = Product.created_after(1.week.ago).like_ranking(MAX_WEEKLY_RANKING)
    @tags = Tag.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @products = Product.published.order(:id)
    @related_products = @product.related_products(MAX_RELATED_PRODUCTS)
    @comments = @product.comments.includes(:user).order(updated_at: :asc)
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
    begin
      @product.fetch_info
    rescue => e
      logger.error e
    end
    unless product_params["desc"].empty?
      @product.desc = product_params["desc"]
    end
    respond_to do |format|
      if @product.save
        format.html { redirect_to root_path, notice: 'プロダクトは正しく申請されました' }
        format.json { render :show, status: :created, location: root_path }
      else
        @product.desc = nil
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

  def fetch
    begin
      @product.fetch_info
    rescue => e
      logger.error e
    end

    if @product.validate
      render :edit, location: @product, notice: 'プロダクト情報は更新されました'
    else
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :url, :desc, :image, :thumbnail, :status, :category_id, :sub_title, :ogpimage, :twitter, :advertisement)
    end

    def product_tags_param
      params.require(:product).permit(:name, :url, :desc, :image, :thumbnail, :sub_title, :ogpimage, :twitter, :advertisement, :tags_to_s)
    end

    def correct_product
      unless @product.published?
        raise Forbidden, '権限がありません' unless current_user&.admin?
      end
    end

    def set_search
      @search = Product.includes(:tags).ransack(params[:q])
    end

    def set_category
      @categories = Category.all
    end

    def product_ranking
      @product_ranking = Product.published.order(likes_count: :desc).limit(MAX_LIKES_RANKING)
    end
end
