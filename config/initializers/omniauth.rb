SETUP_PROC = lambda do |env|
  env['omniauth.strategy'].options[:consumer_key] = ENV['TWITTER_KEY']
  env['omniauth.strategy'].options[:consumer_secret] = ENV['TWITTER_SECRET']
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, :setup => SETUP_PROC
end
