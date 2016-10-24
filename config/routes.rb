Rails.application.routes.draw do
  devise_for :users
  root to: 'expenses#index'

  resources :categories
  resources :earnings
  resources :expenses
end
