Rails.application.routes.draw do
  resource :home, only: :index
  resources :products, only: %i[index show edit update]
  resources :categories, only: %i[index show]
  resources :pricetypes, only: :show
  resources :home, only: :index do
    collection do
      get "search"
    end
  end

  root to: "home#index"
end
