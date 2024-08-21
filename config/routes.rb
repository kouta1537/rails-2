Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  root 'rooms#index'

  resource :user, only: [:show, :edit, :update] do
    collection do
      get 'edit_profile'
      patch 'update_profile'
    end
  end

  resources :rooms
end
