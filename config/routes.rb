Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  get :mypage, to: 'users#show', as: :mypage
  root 'products#index'
  resources :products
  resources :categories
  resources :comments, only: [:create, :edit, :update, :destroy]
  resources :likes, only: [:create, :destroy]
end
