Rails.application.routes.draw do
  devise_for :users
  root "foods#index"
  resources :users, only: [:edit, :update]
  resources :foods
  resources :managements
end
