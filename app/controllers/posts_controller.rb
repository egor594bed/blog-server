class PostsController < ApplicationController
  before_action :find_category_by_key, only: %i[update destroy]
  before_action :find_post_by_id, only: %i[update destroy]

  def create
    post = Post.create(post_params)

    if params[:image]
      post.image.attach(params[:image])
      post.update(image_url: rails_blob_path(post.image))
    end
    
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
  params.permit(:title, :text, :user_id, :category_key)
end
