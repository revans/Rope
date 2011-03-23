module Rope 
  class SocialController < ApplicationController 

    unloadable 

    def new
      if current_user?  
        flash[:notice] = 'You are already signed in. Please sign out if you want to sign in as a different user.'
        redirect_to(root_path)
      end
    end

    def callback
      # TODO: Verify that request.env['rack.auth']['provider'] is still active
      account = case request.env['rack.auth']['provider']
                when 'twitter' then 
                  Rope::TwitterAccount.find_or_create_from_auth_hash(request.env['rack.auth'])
                when 'facebook' then 
                  Rope::FacebookAccount.find_or_create_from_auth_hash(request.env['rack.auth'])
                when 'linked_in' then 
                  Rope::LinkedInAccount.find_or_create_from_auth_hash(request.env['rack.auth'])
                when 'github' then 
                  Rope::GithubAccount.find_or_create_from_auth_hash(request.env['rack.auth'])
                end

      # TODO: Need to patch this one for adding columns on User model
      self.current_user = account.find_or_create_user

      flash[:notice] = 'You have logged in successfully.'
    end

    def failure
      flash[:error] = "We had trouble signing you in. Did you make sure to grant access? Please select a service below and try again."
      # TODO: Need to check if it's needed to have view template since this is a middle ware type
      render :action => 'new'
    end

    def destroy
      logout!
      redirect_to(root_path)
    end
  end
end
