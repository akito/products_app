require "sidekiq/web"

Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users,
             controllers: {
               omniauth_callbacks: "users/omniauth_callbacks",
               registrations: "users/registrations",
             }
  get :mypage, to: "users#show", as: :mypage
  root "products#index"
  resources :products do
    member do
      post :fetch
    end
  end
  resources :categories
  resources :tags
  resources :comments, only: %i[create edit update destroy] do
    member do
      get :notifer
    end
  end

  resources :likes, only: %i[create destroy]
  resources :news, only: %i[new create destroy]
  resources :registrations, only: %i[new create]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  authenticate :user, ->(u) { u.admin? } do
    mount Sidekiq::Web, at: "/sidekiq"
  end

  namespace :manage do
    resources :products, only: [:index]
  end
end
