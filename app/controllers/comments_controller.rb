class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to article_path(@comment.article_id)
    else
      @article = @comment.article
      @comments = @article.comments
      render "article/show"
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to article_path(comment.article_id)
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, article_id: params[:article_id])
  end
end
