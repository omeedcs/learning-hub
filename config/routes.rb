Rails.application.routes.draw do
  devise_for :students
  resources :users
  #get 'home/index'
  get 'home/about'
  get 'home/tutorials'
  get 'home/interactive'
  get 'home/contact'
  get 'home/welcome'
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
