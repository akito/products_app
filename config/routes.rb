Rails.application.routes.draw do
  devise_for :users
  get :mypage, to: 'users#show', as: :mypage
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'
  resources :comments, only: [:create, :edit, :update, :destroy]
  resources :likes, only: [:create, :destroy]
end
