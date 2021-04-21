Rails.application.routes.draw do
  root 'tasks#index'

  resources :tasks do
    member do
      patch :update_state
    end
  end
end
