Rails.application.routes.draw do

  resources :treasurers do
    collection do
      post :confirm
    end
  end

  resources :users, only: [:new, :create, :show]
end
