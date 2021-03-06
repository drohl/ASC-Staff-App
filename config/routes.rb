Rails.application.routes.draw do
  resources :stays
  devise_for :users
  root 'pages#home'
  get "ticketsales" => "pages#ticketsales"
  get "allplanetarium" => "pages#allplanetarium"
  get "groupprograms" => "pages#groupprograms"
  get "dss" => "pages#dss"
  get "eclipse" => "pages#eclipse"
  get "sleepovers" => "pages#sleepovers"
  get "labs" => "pages#labs"
  get "grouptotals" => "pages#grouptotals"
  get "itinerarylong" => "pages#itinerarylong"
  get "itinerary" => "pages#itinerary"
  get "groups" => "pages#groups"
  get "users" => "pages#users"
  get "latelog" => "pages#latelog"
  get "pltmsched" => "pages#pltmschedule"
  get "rescheck" => "pages#rescheck"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
