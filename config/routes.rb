Rails.application.routes.draw do
  get '/hello', to: 'application#hello'

  resources :categories
end
