Rails.application.routes.draw do
  

  devise_for :users
  get '/' => "home#home"
  get '/dashboard' => "home#dashboard"
  get '/matches/index' => "matches#index"
  get '/matches/create/:matched_user_id' => 'matches#create', as: "new_match"
  resources :profiles
  get '/messages/index/:match_id' => 'messages#index', as: 'messages'
  post '/messages/create/' => 'messages#create', as: 'create_message'

  
end
