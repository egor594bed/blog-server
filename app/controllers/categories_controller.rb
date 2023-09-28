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

### Запросы для категорий
# * GET /categories - получить список доступных категорий постов
# * POST /categories - создать новую категорию
# * PUT /categories/:id - изменить информацию о конкретной категории
# * DELETE /categories/:id - удалить конкретную категорию
# get '/categories', to: 'category#index'
# post '/categories', to: 'category#create_category'
# put  '/categories/:key', to: 'category#update_category'
# delete '/categories/:key', to: 'category#delete_category'