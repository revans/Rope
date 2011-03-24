require "koala"

module Rope 
  class FacebookAccount < LoginAccount 
    def assign_account_info(auth_hash)
      # TODO: Verify that the parameters are still the same for the auth_hash
      self.remote_account_id    = auth_hash['uid']
      self.login                = auth_hash['user_info']['nickname']
      self.name                 = auth_hash['user_info']['name']
      self.access_token         = auth_hash['credentials']['token']
    end

    def account_url
      url_stub = ''
      unless self.login.nil?
        url_stub = self.login
      else
        url_stub = self.remote_account_id
      end

      "http://facebook.com/#{url_stub}"
    end

    def post_to_wall(msg)
      # TODO: Should be able to test for exceptions
      @graph.put_object("me", "feed", :message => msg)
    end

    def checkins
      @graph.get_object("me", "checkins")
    end

    private

    def setup_koala
      # TODO: This should be loaded first before calling the api
      @graph = Koala::Facebook::GraphAPI.new(self.access_token)
    end

  end
end
