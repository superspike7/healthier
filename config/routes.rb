Rails.application.routes.draw do
  get '/auth/google/callback', to: 'google_oauth_calendar#create', constraints: lambda { |req| !(req.env['omniauth.origin'] =~ /login/) }
  get '/auth/failure', to: 'google_oauth_calendar#failure', constraints: lambda { |req| !(req.env['omniauth.origin'] =~ /login/) }
  get 'schedule_preview', to: 'exercise_schedules#preview'

  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  devise_scope :user do
    get '/auth/google/callback', to: 'users/omniauth_callbacks#google_oauth2',
                                 as: 'user_google_oauth2_omniauth_callback'
    get '/auth/failure', to: 'users/omniauth_callbacks#failure'
  end

  resources :posts, except: [:edit, :update, :new] do
    resources :comments, only: [:create, :destroy]
    resources :report_post
  end
  resource :dashboard, only: :show, controller: 'dashboard'
  resources :likes, only: [:create, :destroy]
  resources :follows, only: [:create, :destroy]
  resources :daily_intakes, only: [:new, :show]
  resources :direct_conversations, only: %i[create index show update], path: 'direct'
  resources :conversation_messages, only: :create
  resources :notifications, only: :index
  resources :foods, except: :show
  resources :meals, except: :show
  resources :daily_intakes, only: [:index, :create], path: 'daily'
  resources :profiles, only: [:show, :edit, :update], param: 'username', path: 'profile' do
    resources :report_user
  end
  resources :repetition_exercises, except: [:show], path: 'repetitions'
  resources :timed_exercises, except: [:show], path: 'timed'
  resources :routine_exercises, only: [:index], path: 'routines' , as: 'routines'
  resources :routines, only: [:create, :index, :new, :destroy]
  resources :exercise_schedules, only: [:create, :edit, :index, :new], path: 'schedules'

  scope '/daily' do
    resources :daily_intake_foods, only: [:create, :new], path: 'food'
    resources :daily_intake_meals, only: [:create, :new], path: 'meal'
  end

  root 'static_pages#home'

  namespace :admin do
    resources :reports, path_names: {new: 'new/:username' }
    resources :users, except: :show
    resources :users, only: :show, param: :username
  end
end
