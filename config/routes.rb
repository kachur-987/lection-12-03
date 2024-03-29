Rails.application.routes.draw do
  
  get 'photos/new'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  
  scope "(:locale)", locale: /en|uk/ do
    root to: "pages#index"
    
    resources :posts
    resources :photos
    resources :profile
    
    get '/profile_info', to: "profile#profile_info", as: "profile_info"
  end
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
