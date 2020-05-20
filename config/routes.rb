Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  root 'posts#index'

  resources :posts do
    collection do
      get 'autocomplete'
    end
  end

  resources :users, only: [:index, :edit, :update]
end
