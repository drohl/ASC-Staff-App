Rails.application.routes.draw do
  resources :stays
  devise_for :users
  root 'pages#home'
  get "ticketsales" => "pages#ticketsales"
  get "allplanetarium" => "pages#allplanetarium"
  get "planetariumgroups" => "pages#planetariumgroups"
  get "dss" => "pages#dss"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
