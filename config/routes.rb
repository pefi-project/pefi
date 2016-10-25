Rails.application.routes.draw do
  devise_for :users
  root 'expenses#index'

  resources :categories
  resources :earnings
  resources :expenses
end
