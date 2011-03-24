# TODO: I think md5 is not that secure so we need to check if we can use different algo
require "digest/md5"
require "octopi"

module Rope
  class GithubAccount < LoginAccount 
    def assign_account_info(auth_hash)
      self.remote_account_id    = auth_hash['uid']
      self.login                = auth_hash['user_info']['nickname']
      self.name                 = auth_hash['user_info']['name']
      self.access_token         = auth_hash['credentials']['token']
    end
  end
end
