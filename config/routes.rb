Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  root 'home#index'
 

  resources :users, only: [:show, :edit, :update] do
    collection do
      get 'edit_profile'
      patch 'update_profile'
    end
  end

    resources :rooms do
      collection do
      get 'search'
      end

    resources :reservations, only: [:new, :create, :index] do
      member do
      get 'confirm'
      post 'complete'
      end
    end
  end
end
