Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { registrations: "registrations" }
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
  get 'static_pages/invite'
  get 'static_pages/contact'
  get 'static_pages/terms'
  get 'static_pages/privacy'
  get 'static_pages/collection'
  get 'static_pages/accept'
  get 'static_pages/token'
  get 'static_pages/feedback'
  get 'device/registrations/accept'
  
  get 'device/registrations/new'
  

end