Rails.application.routes.draw do
  devise_for :users
  root "managements#index"
  resources :managements
  resources :users, only: [:edit, :update]
  resources :foods, only: [:new, :create, :edit, :update]
end
