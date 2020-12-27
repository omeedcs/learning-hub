Rails.application.routes.draw do
  resources :tutorials
  resources :categories
  resources :articles
  resources :users
  devise_for :students
  get "u/:username" => "home#profile", as: :profile

  # section to pair communities and posts.
  resources :communities do 
  resources :posts
  end 

  resources :subscriptions
  resources :comments, only: [:create]
  #get 'home/index'
  get 'home/about'
  get 'home/tutorials'
  get 'home/interactive'
  get 'home/contact'
  get 'home/welcome'
  get 'home/privacy'
  get 'home/queue'
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
