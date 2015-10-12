Rails.application.routes.draw do

  root 'static_pages#home'
  devise_for :vendors, controllers: {registrations: 'vendors/registrations', sessions: 'vendors/sessions'}
  devise_for :couples, controllers: {registrations: 'couples/registrations', sessions: 'couples/sessions'}

  # GET Routes
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/faq', to: 'static_pages#faq'
  get "/auth/:provider/callback", to: 'authentications#create'
  get "/add_contract", to: 'contracts#add_contract'
  get "/add_approval", to: 'contracts#add_approval'


  # resources :contracts
  resources :couples do
    resources :families  
  end
  resources :vendors
  resources :contracts
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
