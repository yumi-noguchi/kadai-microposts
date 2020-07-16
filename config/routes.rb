Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'
  
  resources :users, only: [:index, :show, :new, :create] do
    member do 
      get :followings
      get :followers
      get :likes
    end
  end
  resources :microposts, only: [:create, :destroy] do
    member do
      post "/favotites/:micropost_id", to: "favorites#create"
      delete "/favorites/:micropost_id", to: "favorites#destroy"
    end
  end  
  resources :relationships, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]
  
end
