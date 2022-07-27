# frozen_string_literal: true

GOOGLE_SETUP_PROC = lambda do |env|
  request = Rack::Request.new(env)
  scope = %w[email profile]
  # TODO: Add additional scope below here when accessing google calendar API
  # scope << "calendar.readonly" if request.params["origin"] != "login"
  env['omniauth.strategy'].options[:scope] = scope.join(',')
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, Figaro.env.google_client_id, Figaro.env.google_client_secret,
           { name: 'google', scope: GOOGLE_SETUP_PROC }
end

