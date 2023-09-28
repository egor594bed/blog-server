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

    if comment
      head :ok
    else
      head :bad_request
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