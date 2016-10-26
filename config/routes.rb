Rails.application.routes.draw do
  devise_for :users
  root 'application#home'

  resources :categories
  resources :earnings
  resources :expenses
end
