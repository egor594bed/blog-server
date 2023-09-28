class UsersController < ApplicationController
  before_action :find_user_by_id, only: %i[update show destroy]
  
  DEFAULT_USERS_ON_PAGE = 10
  def index
    cache_key = "users/#{params[:page]}/#{params[:created_at]}/#{params[:created_before]}"
    
    users = Rails.cache.fetch(cache_key, expires_in: 12.hours) do

      all_users = User.all
      
      all_users = all_users.where('created_at >= ?', DateTime.parse(params[:created_at])) if params[:created_at]
      all_users = all_users.where('created_at <= ?', DateTime.parse(params[:created_before])) if params[:created_before]
      
      offset = (params[:page].to_i - 1) * DEFAULT_USERS_ON_PAGE if params[:page].present?
      offset ||= 0
      
      all_users.limit(DEFAULT_USERS_ON_PAGE).offset((offset) * DEFAULT_USERS_ON_PAGE).order(:id)

    end

    render json: users
  end

  def show
    render json: @user, serializer: UserFullDataSerializer
  end

  def create
    user = User.create(user_params)
    
    if user.persisted?
      head :ok
    else
      render json: user.errors
    end
  end
  
  def update

    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors
    end

  end
  
  def destroy
    @user.destroy!

    head :ok
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end

  def find_user_by_id
    @user = User.find(params[:id])

    status :not_found unless @user
  end

end
