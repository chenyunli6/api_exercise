Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "welcome#index"

  resources :cities do
    member do
      post :update_temp
    end
  end

  namespace :api, :defaults => { :format => :json } do
    namespace :v1 do
      post "/signup" => "auth#signup"
      post "/login" => "auth#login"
      post "/logout" => "auth#logout"

      get "/me" => "users#show", :as => :user
      patch "/me" => "users#update", :as => :update_user

      resources :trains, :only => [:index, :show]
      resources :reservations, :only => [:index, :show, :create, :update, :destroy]
    end
  end
end
