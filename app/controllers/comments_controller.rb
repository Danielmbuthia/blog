class CommentsController < ApplicationController
  def create
   @article = Article.find(params[:article_id])
   @commit = @article.comments.create(comments_params)
    redirect_to article_path(@article)
  end
  def destroy
    @article=Article.find(params[:article_id])
    @commit = @article.comments.find(params[:id])
    @commit.destroy
    redirect_to article_path(@article)
  end
  private
  def comments_params
   params.require( :comment).permit( :commenter, :body)
  end
end
