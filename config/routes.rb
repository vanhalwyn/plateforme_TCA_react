Rails.application.routes.draw do
  devise_for :users
  get 'consultations', to: 'pages#consultations'
  get 'reservations', to: 'pages#reservations'

  namespace :api, defaults: { format: 'json' } do
    get 'creneaux', to: 'creneaux#index', format: 'json'
  end

  root to: 'pages#home'
end
