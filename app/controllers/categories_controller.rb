class CategoriesController < ApplicationController
  before_action :find_category_by_key, only: %i[update destroy]
  def index
    categories = Category.all

    render json: categories
  end

  def create
    category = Category.create(category_params)

    if category.persisted?
      head :ok
    else
      render json: category.errors
    end
    
  end

  def update
 
    if @category.update(name: params[:name], description: params[:description])
      render json: @category
    else
      render json: @category.errors
    end

  end

  def destroy
    category = @category.destroy!

    head :ok
  end

  private

  def category_params
    params.require(:category).permit(:key, :name, :description)
  end
end