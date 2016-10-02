Rails.application.routes.draw do
  get '/hello', to: 'application#hello'

  resources :categories
  resources :earnings
  resources :expenses
end
