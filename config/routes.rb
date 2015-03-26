Rails.application.routes.draw do
  devise_for :users
  root to: 'listings#index'

  resources :users, only: [:index, :show, :edit, :update] do
    resources :notifications
  end
  resources :listings
end
