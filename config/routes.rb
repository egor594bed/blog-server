Rails.application.routes.draw do
  # TODO: resources
  get '/users', to: 'user#index'
  get '/users/:id', to: 'user#get_user'
  post '/users', to: 'user#create_user'
  put '/users/:id', to: 'user#update_user'
  delete '/users/:id', to: 'user#delete_user'

  post '/categories/:key/posts', to: 'post#create_post'
  put  '/categories/:key/posts/:post_id', to: 'post#update_post'
  delete '/categories/:key/posts/:post_id', to: 'post#delete_post'

  post '/categories/:key/posts/:post_id/comments', to: 'comment#create_comment'
  put  '/categories/:key/posts/:post_id/comments/:id', to: 'comment#update_comment'
  delete '/categories/:key/posts/:post_id/comments/:id', to: 'comment#delete_comment'

  get '/categories', to: 'category#index'
  post '/categories', to: 'category#create_category'
  put  '/categories/:key', to: 'category#update_category'
  delete '/categories/:key', to: 'category#delete_category'

end