Rails.application.routes.draw do
  
  # ///////sesiones///////
  get 's/new', to: 'sessions#new'
  get 's/ima', to: "sessions#images", as: 'images'
  post 's/create', to: 'sessions#create', as: 'sc'
  delete 's/delete', to: 'sessions#destroy', as: "c_session"
  
  # //////////////modelo user////////////
  get 'n/user', to: "users#new"
  get 'i/user', to: "users#index"
  post 'c/user', to: "users#create", as: "cu"

  # //////////modelo tweet///////////////////
  get 'i/tweets', to: 'tweets#index'
  post 'c/tweets', to: 'tweets#create', as: 'ct'

  # ////////////modelo like//////////////////
  get 'c/likes/:id_tweet/:id_user', to: 'likes#create', as: "nuevo_like"

  root 'sessions#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
