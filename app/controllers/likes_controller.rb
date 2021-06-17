class LikesController < ApplicationController
  def create
    @article = Article.find(params[:article])
    current_user.like(@article)
  end

  def destroy
    @article = Like.find(params[:id]).article
    current_user.unlike(@article)
  end
end
