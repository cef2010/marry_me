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
  get "/sort_by_type", to: 'vendors#sort_by_type'

  # POST routes
  post '/contacts', to: 'static_pages#create'
  # resources :contracts
  resources :couples do
    resources :families
    resources :comments
  end
  resources :vendors
  resources :contracts


end
