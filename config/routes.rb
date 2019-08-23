Rails.application.routes.draw do
  devise_for :users
  get 'consultations', to: 'pages#consultations'
  get 'reservations', to: 'pages#reservations'
  get 'appointments', to: 'appointments#index', format: 'json'
  resources :orders
  root to: 'pages#home'
end
