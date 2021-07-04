class LikesController < ApplicationController
  def create
    @article = Article.find(params[:article])
    current_user.like(@article)
    redirect_to root_path
  end

  def destroy
    @article = Like.find(params[:id]).article
    current_user.unlike(@article)
    redirect_to root_path
  end
end
