Rails.application.routes.draw do
  # Root route
  root 'dashboard#index'

  # Dashboard route
  get 'dashboard/index'
  get 'dashboard', to: 'dashboard#index', as: 'dashboard'

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # Custom URL for signout using DELETE method
  # devise_scope :user do
  #   delete 'sign_out', to: 'users/sessions#destroy', as: :custom_sign_out
  # end

  # devise_scope :user do
  #   delete 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  # end
  # Devise routes with custom controllers
  # 
  #
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations', 
    passwords: 'users/passwords',  
}      

# devise_for :users

devise_scope :user do
  get '/users/sign_out', to: 'devise/sessions#destroy'
end

# devise_scope :user do
#   delete 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
# end

  # Nested resources for projects and tasks
  resources :projects do
    resources :tasks
  end

  # Resources for other models
  resources :sprints
  resources :members

  # ActionCable mounting
  mount ActionCable.server => '/cable'
end
