Rails.application.routes.draw do
  get "funcionarios/busca", to: "funcionarios#busca", as: :busca_funcionario 
  devise_for :users
  resources :users
  resources :funcionarios, only: [:new, :create, :destroy, :edit, :update]
  root to: "funcionarios#index"
end
