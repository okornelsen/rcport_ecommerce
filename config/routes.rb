Rails.application.routes.draw do
  resource :home, only: %i[index]
  resources :products, only: %i[index show]

  root to: "home#index"
end
