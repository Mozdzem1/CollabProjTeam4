Rails.application.routes.draw do

 resources :users, only: [:edit, :update]
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :issue_areas
  # link-up auth libraries
  devise_for :users

  scope format: false do
    resources :organizations, constraints: { id: /.+/ }
  end
  resources :opportunities

  # added ideas as a resource with all CRUD opertions
  # also added methods approve to allow admin users to approve/unapprove ideas
  resources :opportunities do
    put :favorite, on: :member
  end

  # routes the root directory to the homepage
  root 'welcome#welcome'
  get '/dashboard', to: 'dashboards#index', as: :dashboard_path
 
  #get 'users/:id/edit', to: 'users#edit', as: :edit_user
  patch 'users/:id/edit', to: 'users#update'
  get '/add_tags', to: 'users#show'
  put '/add_tags/add', to: 'users#add_tags', constraints: { sender: /[^\/]+/ }
end
