module UserServices

  class FollowFacebookFriends

    def initialize user
      @user = user
    end

    def perform
      fetch_facebook_friends
      follow_facebook_friends
    end

    private

    def graph
      @graph ||= Koala::Facebook::API.new(@user.fb_auth_token)
    end

    def fetch_facebook_friends
      @facebook_friends ||= graph.get_connections("me", "friends")
    end

    def follow_facebook_friends
      @facebook_friends.each do |friend|
        begin
          facebook_friend = User.find_by_facebook_id(friend["id"])
          @user.follow!(facebook_friend)
        rescue  => e
          # TODO - send error to new relic
        end
      end
    end

  end

end