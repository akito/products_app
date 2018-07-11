class LikesController < ApplicationController
  before_action :set_like, only: :destroy
  before_action :correct_user, only: :destroy

  def create
    @like = Like.new(like_params)
    if @like.save
      flash[:notice] = "いいね!"
    else
      flash[:error] = "いいねできませんでした"
    end
    redirect_to request.referrer
  end

  def destroy
    if @like.destroy
      flash[:notice] = "良くないね！"
    else
      flash[:error] = "良くないねできませんでした"
    end
    redirect_to request.referrer
  end

  protected

    def like_params
      params.require(:like).permit(:user_id, :product_id)
    end

    def set_like
      @like = Like.find(params[:id])
    end

    def correct_user
      raise Forbidden, '権限がありません' unless @like.user_id == current_user.id
    end
end
