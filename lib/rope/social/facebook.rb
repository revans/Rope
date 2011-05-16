module Rope
  module Social
    class Facebook
      def initialize(user)
        @graph = Koala::Facebook::GraphAPI.new(user.oauth_token)
      end
      
      def profile
        @graph.get_object('me')
      end
      
      def contacts
        @graph.get_connections('me', 'friends')
      end

      def my_wall(msg)
        @graph.put_object("me", "feed", :message => msg)
      end

      def post_to_friend_wall(friends, content)
        friends.each do |user|
          @graph.put_wall_post(content[:message], {:name => content[:title], :link => content[:link], :caption => content[:caption], :description => content[:description]}, user)
        end
      end

    end 
  end
end
