module Rope
  module Social
    class TwitterApi
      def initialize(user)
        @twitter_user = Twitter::Client.new(:oauth_token => user.oauth_token, :oauth_token_secret => user.oauth_secret)
      end
      
      def tweet_msg(msg)
        @twitter_user.update(msg)
      end
      
      def direct_msg(twitters, message)
        twitters.each do |ids_|
          @twitter_user.direct_message_create(ids_.to_i, message)
        end
      end
      
      def contacts
        @contacts     = []
        @twitter_user.followers.users.each do |user|
          @contacts << [user.name, user.id]
        end
        @contacts
      end
      
    end
  end
end

