class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = current_user
    @likes = Like.where(user_id: @user.id).includes(:product)
  end
end
