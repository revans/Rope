require "linkedin"

module Rope 
  class LinkedInAccount < LoginAccount 
    def assign_account_info(auth_hash)
      self.remote_account_id    = auth_hash['uid']
      self.name                 = auth_hash['user_info']['first_name']
      self.access_token         = auth_hash['credentials']['token']
      self.access_token_secret  = auth_hash['credentials']['secret']
    end
  end
end
