Rails.application.routes.draw do

  resources :users
  
  resources :categories, only: %i[index create]
  # Если делать через resources, то создается /categories/:id, а не /categories/:key
  # То же самое с posts
  put  '/categories/:key', to: 'categories#update'
  delete '/categories/:key', to: 'categories#destroy'

  scope 'categories/:key' do

    resources :posts, only: %i[create]
    put  '/posts/:post_id', to: 'categories#update'
    delete '/posts/:post_id', to: 'categories#destroy'

    scope 'posts/:post_id' do
      resources :comments, only: %i[create update destroy]
    end
    
  end
  
end