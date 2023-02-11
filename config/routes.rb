Rails.application.routes.draw do
  resources :assets_owners do
    collection do
      post :upload_csv
    end
  end
  resources :assets_movements
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :it_assets do
    collection do
      post :csv_update_import
      post :import
    end
  end

  get 'page/home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "it_assets#index"
  get 'users/index', to: "user#index", as: "users"
  get 'users/show', to: "user#show", as: "show_user"
end
