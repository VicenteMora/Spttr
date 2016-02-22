Rails.application.routes.draw do
  devise_for :users

  get '/dashboard' => "home#home"

  resources :profiles
end
