class ApplicationController < ActionController::API
  private

  def find_category_by_key
    @category = Category.find_by!(key: params[:key])
  end

  def find_post_by_id
    @post = @category.posts.find(params[:post_id])

    if @post.nil?
      render json: { errors: "Post not found" }, status: :not_found
    end

  end
  
end
