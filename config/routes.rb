Rails.application.routes.draw do

  root 'static_pages#home'
  devise_for :vendors, controllers: {registrations: 'vendors/registrations', sessions: 'vendors/sessions'}
  devise_for :couples, controllers: {registrations: 'couples/registrations', sessions: 'couples/sessions'}

  # GET Routes
  get "/auth/:provider/callback", to: 'authentications#create'
  get 'vendors/index'
  get 'vendors/show'
  
  resources :contracts
  resources :couples
  resources :vendors
  resources :attires, controller: 'vendors', type: 'Attire'
  resources :bakers, controller: 'vendors', type: 'Baker'
  resources :caterers, controller: 'vendors', type: 'Caterer'
  resources :rentals, controller: 'vendors', type: 'Rental'
  resources :florists, controller: 'vendors', type: 'Florist'
  resources :invitations, controller: 'vendors', type: 'Invitation'
  resources :musics, controller: 'vendors', type: 'Music'
  resources :others, controller: 'vendors', type: 'Other'
  resources :photobooths, controller: 'vendors', type: 'Photobooth'
  resources :photographers, controller: 'vendors', type: 'Photographer'
  resources :videographers, controller: 'vendors', type: 'Videographer'
  resources :venues, controller: 'vendors', type: 'Venue'

end
