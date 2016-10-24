Rails.application.routes.draw do
  root to: 'expenses#index'

  resources :categories
  resources :earnings
  resources :expenses
end
