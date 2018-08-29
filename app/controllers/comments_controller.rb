class CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit update destroy notifer]
  before_action :correct_user, only: %i[edit update destroy]

  def create
    @comment = current_user.comments.build(comment_params)
    flash[:error] = "コメントを投稿できませんでした" unless @comment.save
    @comments = @comment.product.comments.includes(:user).order(updated_at: :asc)
    @product = @comment.product
  end

  def edit; end

  def notifer
    notifier = Slack::Notifier.new(Rails.application.credentials.slack[:webhook_url])
    notifier.ping("[コメント違反報告] コメントID: #{@comment.id}" + " コメント内容:#{@comment.content}" + " コメントユーザ:#{User.find(@comment.user.id).email}")
    redirect_to product_path(@comment.product_id), notice: "ご報告ありがとうございます。運営チームで調査いたします。"
  end

  def update
    if @comment.update(comment_params)
      flash[:notice] = "修正されました"
      redirect_to product_path(@comment.product_id)
    else
      flash[:error] = "修正されませんでした"
      render :edit
    end
  end

  def destroy
    unless @comment.destroy
      redirect_to product_path(@comment.product_id), notice: "削除できませんでした。お手数ですが、お問い合わせからご連絡ください。"
    end
    @comments = @comment.product.comments.includes(:user).order(updated_at: :asc)
    @product = @comment.product
  end

  private

    def comment_params
      params.require(:comment).permit(:content, :product_id)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def correct_user
      raise Forbidden, "権限がありません" unless @comment.owned_by?(current_user)
    end
end
