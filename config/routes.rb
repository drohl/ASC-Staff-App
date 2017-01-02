Rails.application.routes.draw do
  resources :stays
  devise_for :users
  root 'pages#home'
  get "ticketsales" => "pages#ticketsales"
  get "allplanetarium" => "pages#allplanetarium"
  get "groupprograms" => "pages#groupprograms"
  get "dss" => "pages#dss"
  get "sleepovers" => "pages#sleepovers"
  get "grouptotals" => "pages#grouptotals"
  get "itinerarylong" => "pages#itinerarylong"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
