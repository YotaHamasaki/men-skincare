Rails.application.routes.draw do
    root to: "toppages#index"
    get "login" , to: "sessions#new"
    post "login" , to: "sessions#create"
    delete "logout", to: "sessions#destroy"
    get "signup", to: "users#new"
    resources :users, only:[:new, :create, :show] do
        resources :posts, only:[:edit, :update, :destroy]
    end
    
    get "items" , to: "items#index"
    
    namespace :admin do
        resources :items, only:[:new, :create, :show, :destroy]   
    end
    
    resources :items, only:[:show, :destroy]  do
        resources :posts, only:[:new, :create]
    end
end    