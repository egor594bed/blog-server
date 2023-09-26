class PostController < ApplicationController
  before_action :find_category_by_key, only: %i[update_post delete_post]
  before_action :find_post_by_id, only: %i[update_post delete_post]

  def create_post 
    post = Post.create(title: params[:title], text: params[:text], user_id: params[:user_id], category_key: params[:key])

    render json: post 
  end

  def update_post
    if @post.update(title: params[:title], text: params[:text], user_id: params[:user_id], category_key: params[:key])
      render json: @post
    else
      render json: @post.errors
    end
  end

  def delete_post
    post = @post.destroy

    render json: post
  end
end

### Запросы для постов
# * POST /categories/:key/posts - создать новый пост
# * PUT /categories/:key/posts/:post_id - изменить информацию о конкретном посте
# * DELETE /categories/:key/posts/:post_id - удалить конкретный пост

# post '/categories/:key/posts', to: 'post#create_post'
# put  '/categories/:key/posts/:post_id', to: 'post#update_post'
# delete '/categories/:key/posts/:post_id', to: 'post#delete_post'