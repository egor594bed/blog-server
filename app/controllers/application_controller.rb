class ApplicationController < ActionController::API
  private
  # TODO: move common private methods into each controller private methods
  # TODO: method find! that raise exception if not found
  def find_user_by_id
    @user = User.find(params[:id])
  end

  def find_category_by_key
    @category = Category.find_by(key: params[:key])
  end

  def find_post_by_id
    @post = @category.posts.find(params[:post_id])
  end
end
