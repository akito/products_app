class CommentsController < ApplicationController
  def create
    if current_user.comments.create(comment_params)
      flash[:notice] = "OK"
    else
      flash[:error] = "NG"
    end
    redirect_to product_path(comment_params[:product_id])
  end

  protected

  def comment_params
    params.require(:comment).permit(:content, :product_id)
  end
end

