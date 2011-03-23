module Rope 
  module SocialHelper 
    def auth_request_path(options = {})
      "/auth/#{options[:service]}"
    end

    def twitter_login_button
      content_tag(:a, content_tag(:span, 'Sign in with Twitter'), :class => 'rope-button twitter', :href => auth_request_path(:service => 'twitter')
    end

    def facebook_login_button
      content_tag(:a, content_tag(:span, 'Sign in with Facebook'), :class => 'rope-button facebook', :href => auth_request_path(:service => 'facebook')
    end

    def linkedin_login_button
      content_tag(:a, content_tag(:span, 'Sign in with LinkedIn'), :class => 'rope-button linkedin', :href => auth_request_path(:service => 'linked_in')
    end

    def github_login_button
      content_tag(:a, content_tag(:span, 'Sign in with Github'), :class => 'rope-button github', :href => auth_request_path(:service => 'github')
    end

  end
end
