Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { registrations: "registrations" }
  resources :websites
  resources :users
  resources :collections
  resources :contacts
  resources :feedbacks
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'static_pages#index'
  delete 'static_pages/destroy'

  get 'static_pages/show'
  get 'static_pages/contact'
  get 'static_pages/terms'
  get 'static_pages/privacy'
  get 'static_pages/collection'

  get 'device/registrations/new'
end