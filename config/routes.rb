Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root to: "restaurants#index"

  resources :restaurants, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:new, :create]
  end
end
