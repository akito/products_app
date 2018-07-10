class LikesController < ApplicationController
  def create
    like = Like.new(like_params)
    if like.save
      flash[:notice] = "いいね!"
    else
      flash[:error] = "いいねできませんでした"
    end
    redirect_to root_path
  end

  def destroy
    like = Like.find(params[:id])
    if like.destroy
      flash[:notice] = "良くないね！"
    else
      flash[:error] = "良くないねできませんでした"
    end
    redirect_to root_path
  end

  protected

    def like_params
      params.require(:like).permit(:user_id, :product_id)
    end
end
