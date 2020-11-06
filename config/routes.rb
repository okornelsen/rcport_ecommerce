Rails.application.routes.draw do
  resource :home, only: %i[index]
  resources :products, only: %i[index show]
  resources :home, only: %i[index] do
    collection do
      get "search"
    end
  end

  root to: "home#index"
end
