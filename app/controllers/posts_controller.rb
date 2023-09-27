class PostsController < ApplicationController
  before_action :find_category_by_key, only: %i[update destroy]
  before_action :find_post_by_id, only: %i[update destroy]

  def create
    post = Post.create(post_params)

    if post.persisted?
      head :ok
    else
      render json: post.errors
    end

  end

  def update
    if @post.update(title: params[:title], text: params[:text])
      render json: @post
    else
      render json: @post.errors
    end
  end

  def destroy
    post = @post.destroy!

    head :ok
  end
end

private

def post_params
  params.require(:post).permit(:title, :text, :user_id, :category_key)
end

### Запросы для постов
# * POST /categories/:key/posts - создать новый пост
# * PUT /categories/:key/posts/:post_id - изменить информацию о конкретном посте
# * DELETE /categories/:key/posts/:post_id - удалить конкретный пост

# post '/categories/:key/posts', to: 'post#create_post'
# put  '/categories/:key/posts/:post_id', to: 'post#update_post'
# delete '/categories/:key/posts/:post_id', to: 'post#delete_post'