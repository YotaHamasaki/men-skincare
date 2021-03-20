Rails.application.routes.draw do
    root to: "toppages#index"
    get "login" , to: "sessions#new"
    post "login" , to: "sessions#create"
    delete "logout", to: "sessions#destroy"
    get "signup", to: "users#new"
    resources :users, only:[:new, :create]
    get "items" , to: "items#index"
    resources :items, only:[:new, :create, :show]  
end
