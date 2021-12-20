Rails.application.routes.draw do
  devise_for :user_manages
  root to: "items#index"
  resources :items, except: :create
end
