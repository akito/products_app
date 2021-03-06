module Manage
  class ProductsController < ApplicationController
    before_action :authenticate_admin_user!
    # GET /products
    def index
      @products = Product.draft.includes(:tags).order(created_at: :desc).page(params[:page])
    end
  end
end
