Rails.application.routes.draw do
  devise_for :users
  get 'consultations', to: 'pages#consultations'
  get 'appointments', to: 'appointments#index', format: 'json'
  get 'reservations', to: 'pages#reservations'
  get 'paiement', to: 'orders#new_payment'
  patch 'paiement', to: 'orders#create_payment'
  resources :orders
  root to: 'pages#home'
end
