Rails.application.routes.draw do

  get 'users/index'
  get 'users/show'
  root to: "homes#top"
  get 'about' => 'homes#about', as:"about"
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
  resources :users, only:[:index, :show, :edit, :update]

end