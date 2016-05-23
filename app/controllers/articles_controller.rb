class ArticlesController < ApplicationController
  include PathHelper

  def show
    @article = Article.find(params[:id])
  end

  def new
    @category = Category.find(params[:category_id])
    @article = Article.new
  end

  def create
    @category = Category.find(params[:category_id])
    @article = @category.articles.new(article_params)

    if @article.save
      @edit_link = category_article_path(@category, @article) + '?creator=true'
      flash[:alert] = 'Save this url to edit/delete this article:'
      redirect_to @edit_link
    else
      render 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
    @category = @article.category
  end

  def update
    @article = Article.find(params[:id])
    @category = @article.category
    @edit_link = category_article_path(@category, @article) + '?creator=true'
    if @article.update(article_params)
      redirect_to @edit_link
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to cat_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :description, :location, :price, :image, :email)
  end
end
