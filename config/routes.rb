Rails.application.routes.draw do
  get '/auth/google/callback', to: 'google_oauth_calendar#create', constraints: lambda { |req| !(req.env['omniauth.origin'] =~ /login/) }
  get '/auth/failure', to: 'google_oauth_calendar#failure', constraints: lambda { |req| !(req.env['omniauth.origin'] =~ /login/) }

  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  devise_scope :user do
    get '/auth/google/callback', to: 'users/omniauth_callbacks#google_oauth2',
                                 as: 'user_google_oauth2_omniauth_callback'
    get '/auth/failure', to: 'users/omniauth_callbacks#failure'
  end

  resources :posts do
    resources :comments
    resources :report_post
  end
  resources :likes, only: [:create, :destroy]
  resources :follows, only: [:create, :destroy]
  resources :destroy_attachments, only: [:destroy]
  resources :daily_intakes, only: [:new, :show]
  resources :exercises, only: [:new, :show]
  resources :direct_conversations, only: %i[create index show update], path: 'direct'
  resources :conversation_messages, only: :create
  resources :notifications, only: :index
  resources :foods
  resources :meals do
    resources :foods_meals, only: [:create, :destroy, :new], path: 'food', as: 'foods'
  end
  resources :daily_intakes, only: [:index, :show, :create], path: 'daily'
  resources :post_reports, only: :new, path_names: { new: 'new/:post_id' }
  resource :profile, controller: 'profile', only: [:show, :edit, :update]
  resources :repetition_exercises, path: 'repetitions'
  resources :timed_exercises, path: 'timed'
  resources :category_exercises, only: [:index], as: 'routines'
  resources :categories do
    resources :category_exercises, only: [:create, :new], path: 'exercise', as: 'exercises'
    resources :category_repetition_exercises, only: :destroy, path: 'repetition', as: 'repetition_exercise'
    resources :category_timed_exercises, only: :destroy, path: 'timed', as: 'timed_exercise'
  end
  resources :exercise_schedules, only: [:create, :edit, :index, :new], path: 'schedules'

  scope '/daily' do
    resources :daily_intake_foods, only: [:create, :new, :destroy], path: 'food'
    resources :daily_intake_meals, only: [:create, :new], path: 'meal'
  end

  root 'dashboard#index'

  namespace :admin do
    resources :reports, path_names: {new: 'new/:username' }
    resources :users, except: :show
    resources :users, only: :show, param: :username
  end

  resources :profile do
    resources :report_user
  end
end
