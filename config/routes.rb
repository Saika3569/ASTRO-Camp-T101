Rails.application.routes.draw do
  root 'tasks#index'

  resource :users, controller: 'registrations'
  resource :users, controller: 'sessions',only:[] do
    get :sign_in, action: 'new'
    post :sign_in, action: 'create'
    delete :sign_out, action: 'destroy'
  end


  resources :tasks do
    member do
      patch :update_state
    end
  end
end
