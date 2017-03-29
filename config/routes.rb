Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { registrations: "users/registrations" }
  resources :websites
  resources :users
  resources :collections
  resources :contacts
  resources :feedbacks
  resources :invites
  resources :tokens
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'static_pages#index'
  post 'accepts/mail' => 'accepts#mail', :as => :mail_accepts
  delete 'static_pages/destroy'
  get 'static_pages/show'
  get '/invite',to:'static_pages#invite', :as => :static_invite
  get '/contact',to:'static_pages#contact', :as => :static_contact
  get '/terms' ,to:'static_pages#terms', :as => :static_terms
  get '/privacy',to:'static_pages#privacy', :as => :static_privacy
  get '/collection',to:'static_pages#collection', :as => :static_collection
  get '/accept',to:'static_pages#accept', :as => :static_accept
  get '/token',to:'static_pages#token', :as => :static_token
  get '/feedback',to:'static_pages#feedback', :as => :static_feedback
end