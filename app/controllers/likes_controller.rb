class LikesController < ApplicationController
  before_action :set_like, only: :destroy
  before_action :correct_user, only: :destroy

  def create
    @like = Like.new(like_params)
    flash[:error] = "お気に入りに追加できませんでした" unless @like.save
  end

  def destroy
    flash[:error] = "お気に入りを削除できませんでした。" unless @like.destroy
    redirect_back(fallback_location: root_path)
  end

  protected

    def like_params
      params.require(:like).permit(:user_id, :product_id)
    end

    def set_like
      @like = Like.find(params[:id])
    end

    def correct_user
      raise Forbidden, "権限がありません" unless @like.owned_by?(current_user)
    end
end
