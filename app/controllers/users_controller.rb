class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = current_user
    @likes = @user.likes.includes(product: :tags).page(params[:page])
    @products = Product.published.random(3)
  end
end
