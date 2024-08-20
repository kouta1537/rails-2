Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  resource :user, only: [:show, :edit, :update]
  root 'home#index'
end
