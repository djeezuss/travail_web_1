Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'voitures#index'

  get  '/voitures',       to: 'voitures#index', as: 'voitures'
  post '/voitures',       to: 'voitures#create'
  get  '/voitures/new',   to: 'voitures#new',   as: 'new_voiture'
  get  '/voitures/:id',   to: 'voitures#show',  as: 'voiture'
  patch  '/voitures/:id', to: 'voitures#update'
  put  '/voitures/:id',   to: 'voitures#update'
  delete '/voitures/:id', to: 'voitures#destroy'
end
