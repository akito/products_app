class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = current_user
    @likes = @user.likes.includes(:product).page(params[:page])
    @products = Product.take(3)
  end
end
