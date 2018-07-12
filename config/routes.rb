Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  root 'products#index'
  resources :products
  resources :categories
  resources :comments, only: [:create, :edit, :update, :destroy]
  resources :likes, only: [:create, :destroy]
end
