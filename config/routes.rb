Rails.application.routes.draw do

  get 'sessions/new'
  resources :treasurers do
    collection do
      post :confirm
    end
  end

  resources :users, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :favorites, only: [:create, :destroy]
end
