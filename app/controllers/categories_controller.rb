class CategoriesController < ApplicationController

  def index
    @categories = Category.all    
  end

  def show
    @category = Category.find(params[:id])
    @things = @category.products.order(:id)
  end

end