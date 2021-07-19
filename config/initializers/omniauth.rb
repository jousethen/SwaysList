Rails.application.config.middleware.use OmniAuth::Builder do
    OmniAuth.config.allowed_request_methods = [:post, :get]
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET'] 
end 
