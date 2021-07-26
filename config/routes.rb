Rails.application.routes.draw do
  root "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :users, only: [:create, :show]
    resource :session, only: [:create, :destroy]
    resources :microposts, only: [:index, :show, :create, :update, :destroy]
    namespace :me do
      resource :accounts, only: [:update]
    end
  end
end
