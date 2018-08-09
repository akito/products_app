Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users,
             controllers: {
                 omniauth_callbacks: 'users/omniauth_callbacks',
                 registrations: 'users/registrations' }
  get :mypage, to: 'users#show', as: :mypage
  root 'products#index'
  resources :products
  resources :categories
  resources :tags
  resources :comments, only: [:create, :edit, :update, :destroy]
  resources :likes, only: [:create, :destroy]
  resources :registrations, only: %i[new create]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  namespace :manage do
    resources :products, only: [:index]
  end

end
