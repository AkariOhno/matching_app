Rails.application.routes.draw do


  post 'likes/:post_id/create' => 'likes#create'
  post 'likes/:post_id/destroy' => 'likes#destroy'

  get 'users/index' => 'users#index'
  get 'users/new' => 'users#new'
  post 'users/create' => 'users#create'
  get 'users/login' => 'users#login_form'
  post 'users/login' => 'users#login'
  get 'users/logout' => 'users#logout'

  get 'users/:id/likes' => 'users#likes'
  get 'users/:id/edit' => 'users#edit'
  post 'users/:id/update' => 'users#update'
  get 'users/:id' => 'users#show'

  get 'posts/index' => 'posts#index'
  get 'posts/index/dogs' => 'posts#dogs'
  get 'posts/index/cats' => 'posts#cats'
  get 'posts/index/male' => 'posts#male'
  get 'posts/index/female' => 'posts#female'
  get 'posts/new' => 'posts#new'
  post 'posts/create' => 'posts#create'

  get 'posts/:id/edit' => 'posts#edit'
  post 'posts/:id/update' => 'posts#update'
  post 'posts/:id/destroy' => 'posts#destroy'
  get 'posts/:id' => 'posts#show'

  get 'adopt/:id/request' => 'adopt#request'
  get 'adopt/:id/ensure' => 'adopt#ensure'
  get 'adopt/:id/send' => 'adopt#send'

  get '/' => 'home#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
