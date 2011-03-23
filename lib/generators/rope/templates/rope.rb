Rope.setup do |config|
  # => Twitter 
  # config.twitter 'APP_KEY', 'APP_SCRET'
 
  # => Facebook
  # config.facebook 'APP_KEY', 'APP_SCRET', :scope => 'publish_stream'
  
  # => Github
  # config.github 'APP_KEY', 'APP_SCRET'

  # => LinkedIn
  # config.github 'APP_KEY', 'APP_SCRET'

  if Rails.env.production?
    # Configs for production goes here
  elsif Rails.env.development?
    # Configs for production goes here
  end

end
