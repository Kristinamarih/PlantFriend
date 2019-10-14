Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oath2, ENV['GOOGLE_CLIENT_KEY'], ENV['GOOGLE_CLIENT_SECRET']
end