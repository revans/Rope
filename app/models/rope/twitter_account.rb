module Rope 
  class TwitterAccount < LoginAccount 
    def assign_account_info(auth_hash)
      # TODO: Verify that the parameters are still the same for the auth_hash
      self.remote_account_id    = auth_hash['uid']
      self.login                = auth_hash['user_info']['nickname']
      self.name                 = auth_hash['user_info']['name']
      self.access_token         = auth_hash['credentials']['token']
    end

    def account_url
      # TODO: Need to validate if login is nil then use uid
      "http://twitter.com/#{self.login}"
    end

    # TODO: Add related api calls to this model like wall post and check ins
  end
end
