Rails.application.routes.draw do
  get "funcionarios/new", to: "funcionarios#new"
  post "funcionarios", to: "funcionarios#create"
  root to: "funcionarios#index"
end
