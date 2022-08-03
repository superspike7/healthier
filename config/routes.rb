Rails.application.routes.draw do
  
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  devise_scope :user do
    get '/auth/google/callback', to: 'users/omniauth_callbacks#google_oauth2',
                                 as: 'user_google_oauth2_omniauth_callback'
    get '/auth/failure', to: 'users/omniauth_callbacks#failure'
  end
  
  resources :posts do
    resources :comments
  end
  
  resources :destroy_attachments, only: [:destroy]
  resources :daily_intakes, only: [:new, :show]
  resources :exercises, only: [:new, :show]
  resources :direct_conversations, only: %i[create edit index show update], path: 'direct'
  resources :conversation_messages, only: :create
  resources :notifications, only: :index

  root 'dashboard#index'

  namespace :admin do
    resources :users
  end

  resources :userreports
end
