Rails.application.routes.draw do
  devise_for :users
  get '/' => "home#home"
  get '/dashboard' => "home#dashboard"

  resources :profiles
end
