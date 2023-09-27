class CategoryController < ApplicationController
  before_action :find_category_by_key, only: %i[update_category delete_category]
  def index
    categories = Category.all

    render json: categories
  end

  def create_category
    category = Category.create(category_params)

    if category.persisted?
      render json: category
    else
      render json: category.errors
    end
    
  end

  def update_category
    category = @category.update(category_params)

    render json: category
  end

  def delete_category
    category = @category.destroy

    render json: category
  end

  private

  def category_params
    params.permit(:key, :name, :description)
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