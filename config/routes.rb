Rails.application.routes.draw do

  get 'sessions/new'
  resources :treasurers do
    collection do
      post :confirm
    end
    resources :comments
  end
root 'top#index'
  resources :users do
    collection do
      get :showkid
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  post 'guest_login', to: "guest_sessions#create"
  post 'parent_guest_login', to: "parent_guest_sessions#create"
  post 'admin_guest_login', to: "admin_guest_sessions#create"
  resources :favorites, only: [:index, :create, :destroy]
  namespace :admin do
    resources :users
  end

  resources :managements, only: [:new, :create, :destroy]

end
