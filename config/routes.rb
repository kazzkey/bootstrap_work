Rails.application.routes.draw do
  resources :favorites, only: [:create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  resources :blogs
  root to: 'blogs#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
