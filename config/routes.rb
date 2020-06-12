Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'posts#index'
  resources :posts, only: [ :index, :new, :create, :show ]
  resources :tags, only: [ :show ]
  get 'show_modal/:id', to: 'posts#show_modal', as: :show_modal
end
