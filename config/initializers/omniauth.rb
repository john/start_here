Rails.application.config.middleware.use OmniAuth::Builder do
  provider :linked_in, configatron.linkedin.key, configatron.linkedin.secret
  provider :github, 'KEY', 'SECRET'
  provider :twitter, configatron.twitter.key, configatron.twitter.secret
  provider :facebook, 'KEY', 'SECRET'
end

