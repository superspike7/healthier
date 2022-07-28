Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  devise_scope :user do
    get '/auth/google/callback', to: 'users/omniauth_callbacks#google_oauth2',
                                 as: 'user_google_oauth2_omniauth_callback'
    get '/auth/failure', to: 'users/omniauth_callbacks#failure'
  end

<<<<<<< HEAD
<<<<<<< HEAD
  resources :daily_intakes, only: [:new, :show]
  resources :exercises, only: [:new, :show]
=======
  resources :conversations, only: %i[show create]
<<<<<<< HEAD
>>>>>>> add messages controller
=======
=======
  resources :conversations, only: %i[index show create]
>>>>>>> fix logic for initiating of conversation and sending of message
  resources :conversation_messages, only: %i[create]
>>>>>>> replace messages controller with conversation_messages controller

  root 'dashboard#index'
end
