Rails.application.routes.draw do
  get 'home/index'

  root to: 'home#index'
  devise_for :users, controllers: { registrations: 'users/registrations'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resource :profile, only: [:show, :edit, :update]
  resources :users, only: [:show]
end
