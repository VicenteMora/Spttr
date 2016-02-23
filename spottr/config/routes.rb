Rails.application.routes.draw do
  devise_for :users
  get '/' => "home#home"
  get '/dashboard' => "home#dashboard"
  get '/matches/index' => "matches#index"
  resources :profiles
end
