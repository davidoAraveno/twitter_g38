Rails.application.routes.draw do
  
  # ///////sesiones///////
  get 's/new', to: 'sessions#new'
  get 's/ima', to: "sessions#images", as: 'images'
  post 's/create', to: 'sessions#create', as: 'sc'
  
  # //////////////modelo usuario////////////
  get 'n/user', to: "users#new"


  root 'sessions#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
