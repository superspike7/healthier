Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  devise_scope :user do
    match '/auth/google/callback', to: 'users/omniauth_callbacks#google_oauth2',
                                   via: %i[get post], as: 'user_google_oauth2_omniauth_callback'
    get '/auth/failure', to: 'users/omniauth_callbacks#failure'
  end

  root 'static_pages#home'
end
