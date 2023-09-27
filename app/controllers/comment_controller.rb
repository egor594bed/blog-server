class CommentController < ApplicationController
  before_action :find_category_by_key, only: %i[update_comment delete_comment]
  before_action :find_post_by_id, only: %i[update_comment delete_comment]

  def create_comment
    comment = Comment.create(post_id: params[:post_id], user_id: params[:user_id], text: params[:text], score: params[:score] || 0)

    if comment.persisted?
      render json: comment
    else
      render json: comment.errors
    end

  end

  def update_comment
    comment = @post.comments.find(params[:id]).update(text: params[:text], score: params[:score])

    render json: comment
  end

  def delete_comment
    comment = @post.comments.find(params[:id]).destroy

    render json: comment
  end

end

### Запросы для комментариев
# * POST /categories/:key/posts/:post_id/comments - создать новый комментарий
# * PUT /categories/:key/posts/:post_id/comments/:id - изменить информацию о конкретном комментарии
# * DELETE /categories/:key/posts/:post_id/comments/:id - удалить конкретный комментарий
# post '/categories/:key/posts/:post_id/comments', to: 'comment#create_comment'
# put  '/categories/:key/posts/:post_id/comments/:id', to: 'comment#update_comment'
# delete '/categories/:key/posts/:post_id/comments/:id', to: 'comment#delete_comment'