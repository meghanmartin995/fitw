Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'posts#index'
  resources :posts, only: [ :index, :new, :create, :show ]
  resources :tags, only: [ :show ]
  get 'show_modal/:id', to: 'posts#show_modal', as: :show_modal
  get 'free', to: 'posts#free', as: :free
  post 'free', to: 'posts#free', as: :free_posts
  get 'google', to: 'posts#google', as: :google
  post 'google', to: 'posts#google', as: :google_posts
  get 'squarespace', to: 'posts#squarespace', as: :squarespace
  post 'squarespace', to: 'posts#squarespace', as: :squarespace_posts
end
