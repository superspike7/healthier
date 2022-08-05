# frozen_string_literal: true

SCOPE = lambda do |env|
  request = Rack::Request.new(env)
  scope = %w[email profile]
  scope << 'calendar.events' if request.params['origin'] != 'login'
  env['omniauth.strategy'].options[:scope] = scope.join(',')
end

CONSENT = lambda do |env|
  request = Rack::Request.new(env)
  request.params['origin'] == 'login' ? '' : 'consent'
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, Figaro.env.google_client_id, Figaro.env.google_client_secret,
           { name: 'google', scope: SCOPE, prompt: CONSENT }
end
