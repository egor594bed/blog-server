class CommentsController < ApplicationController
  before_action :find_category_by_key, only: %i[update destroy]
  before_action :find_post_by_id, only: %i[update destroy]

  def create
    comment = Comment.create(comment_params)

    if comment.persisted?
      head :ok
    else
      render json: comment.errors
    end

  end

  def update
    comment = @post.comments.find(params[:id]).update(text: params[:text], score: params[:score])

    if comment.persisted?
      render json: comment
    else
      render json: comment.errors
    end

  end

  def destroy
    comment = @post.comments.find(params[:id]).destroy!

    head :ok
  end

  private

  def comment_params
    params.require(:comment).permit(:post_id, :user_id, :text, :score)
  end
end

### Запросы для комментариев
# * POST /categories/:key/posts/:post_id/comments - создать новый комментарий
# * PUT /categories/:key/posts/:post_id/comments/:id - изменить информацию о конкретном комментарии
# * DELETE /categories/:key/posts/:post_id/comments/:id - удалить конкретный комментарий
# post '/categories/:key/posts/:post_id/comments', to: 'comment#create_comment'
# put  '/categories/:key/posts/:post_id/comments/:id', to: 'comment#update_comment'
# delete '/categories/:key/posts/:post_id/comments/:id', to: 'comment#delete_comment'