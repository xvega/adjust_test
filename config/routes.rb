Rails.application.routes.draw do
  root 'repositories#index'
  resources :repositories, only: :index
end
