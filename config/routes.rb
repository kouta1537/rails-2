Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  root 'home#index'
 

  resource :user, only: [:show, :edit, :update] do
    collection do
      get 'edit_profile'
      patch 'update_profile'
    end
  end

  resources :rooms do
    collection do
      get 'search'
    end
  end
end
