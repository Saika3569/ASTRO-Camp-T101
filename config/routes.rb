Rails.application.routes.draw do
  resources :tasks do
    member do
      patch :update_state
    end
  end

  root 'tasks#index'
end
