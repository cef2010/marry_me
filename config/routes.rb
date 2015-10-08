Rails.application.routes.draw do
  root 'static_pages#home'

  devise_for :vendors, controllers: {registrations: 'vendors/registrations', sessions: 'vendors/sessions'}
  devise_for :couples, controllers: {registrations: 'couples/registrations', sessions: 'couples/sessions'}

  # GET Routes
  get "/auth/:provider/callback", to: 'authentications#create'
  get 'vendors/index'
  get 'vendors/show'
end
