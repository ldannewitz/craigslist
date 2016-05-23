class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    # p params
    @category = Category.find_by(name: params[:category])
  end
end

