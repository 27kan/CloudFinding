class LikesController < ApplicationController

  before_action :set_params
  
  def like
    like = current_user.likes.new(article_id: @article.id)
    like.save
  end

  def unlike
    like = current_user.likes.find_by(article_id: @article.id).destroy
  end

  private
  def set_params
    @article = Article.find(params[:article_id])
    @id_name = "#like-button-#{@article.id}"
  end
end
