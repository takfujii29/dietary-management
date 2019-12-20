Rails.application.routes.draw do
  devise_for :users
  root "managements#index"
  resources :users, only: [:edit, :update]
end
