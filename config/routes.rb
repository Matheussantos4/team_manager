Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :funcionarios, only: [:new, :create, :destroy]
  root to: "funcionarios#index"
end
