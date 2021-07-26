Rails.application.routes.draw do
  root "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :users, only: [:create]
    resource :session, onlu: [:create, :destroy]
    resources :microposts, only: [:index, :show, :create, :update, :destroy]
  end
end
