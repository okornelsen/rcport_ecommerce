Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resource :home, only: :index
  resources :products, only: %i[index show edit update]
  resources :categories, only: %i[index show]
  resources :pricetypes, only: :show
  resources :cart, only: %i[index create destroy]
  resources :home, only: :index do
    collection do
      get "search"
    end
  end

  root to: "home#index"
end
