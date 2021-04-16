Rails.application.routes.draw do
  resources :tasks do
    member do
      patch :pend
      patch :progress
      patch :finish
    end
  end

  root 'tasks#index'
end
