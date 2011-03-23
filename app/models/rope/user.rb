module Rope 
  class User 
    include Mongoid::Document
    include Mongoid::Timestamps

    field :remember_token, :type => String 

    # TODO: Need to check for multiple logins since we are using for checkins
    references_one :login_account, :class_name => 'Rope::LoginAccount'

    def login
      login_account.login unless login_account.nil?
    end

    def name
      login_account.name unless login_account.nil?
    end

    def access_token
      login_account.access_token unless login_account.nil?
    end

    def to_param
      if !self.login.include?('profile.php?')
        "#{self.id}-#{self.login.gsub('.', '-')}"
      else
        self.id.to_s
      end
    end

    def from_twitter?
      login_account.kind_of? TwitterAccount
    end
    
    def from_facebook?
      login_account.kind_of? FacebookAccount
    end

    def from_linkedin?
      login_account.kind_of? LinkedInAccount
    end
    
    def from_github?
      login_account.kind_of? GithubAccount
    end

    def remember
      update_attributes(:remember_token => ::BCrypt::Password.create("#{Time.now}-#{self.login_account.class}-#{self.login}")) unless new_record?
    end

    def forget
      update_attributes(:remember_token => nil) unless new_record?
    end

  end
end
