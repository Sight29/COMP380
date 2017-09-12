Rails.application.routes.draw do
#these are the routes for the different pages
  devise_for :authors
  root to: 'blog/posts#index'
  #expects author in the url
  namespace :authors do
    get '/account' => 'accounts#edit', as: :account
    put '/info' => 'accounts#update_info', as: :info
    put '/change_password' => 'accounts#change_password', as: :password
  
    resources :posts
  end 
    resources :charges
  end

#the app has been divided into 2 modules. Blog and authors
  scope module:  'blog' do
    get 'about' => 'pages#about', as: :about 
    get 'pricing' => 'pages#pricing', as: :pricing
    get 'posts' =>  'posts#index' ,   as: :posts
    get 'posts/:id' =>  'posts#show',   as: :post
  end
end