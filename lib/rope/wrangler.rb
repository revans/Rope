require "bson"

class Rope::Wrangler < Sinatra::Base
  # TODO: Move this to environment
  enable :session
  enable :run

  helpers do
    def current_user
      # TODO: Should move this to a different class
      
      unless session['warden.user.user.key'].nil?
        @current_user = User.find(session['warden.user.user.key'][1].to_s)
      end
      
      @current_user
    end
  end

  get '/test' do 
    "Hello #{current_user.name}! from Wrangler"
  end

  get '/auth/:provider/callback' do
    # TODO: Create database record
    auth = request.env['omniauth.auth']
    # auth.inspect
    # "#{auth['credentials']['token']} : #{auth['provider']} : #{auth['uid']} "
    user_auth = Authentication.where(x
      :provider => auth['provider'], 
      :remote_id => auth['uid'],
      :oauth_token => auth['credentials']['token'],
      :oauth_secret => auth['credentials']['secret'])
    
    if user_auth.first.nil? and current_user.nil?
       redirect '/register/signup'
    else
      if user_auth.first.nil?
        user_ = current_user.authentications.find_or_create_by(
          :provider => auth['provider'], 
          :remote_id => auth['uid'], 
          :oauth_token => auth['credentials']['token'],
          :oauth_secret => auth['credentials']['secret'])
      else
        user_ = user_auth.first
      end
      
      if current_user
        redirect "/users/#{user_.user.id}"
      else
        #auto sign in
        #TODO call sign_in_and_redirect(:user, user.user)
        redirect "/users/#{user_.user.id}/auto_login"
      end
    end

  end

end
