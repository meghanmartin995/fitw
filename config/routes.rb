Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'posts#index'
  resources :posts, only: [ :index, :new, :create ]
  resources :vibes, only: [ :show ]
end
