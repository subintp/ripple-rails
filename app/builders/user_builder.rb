class UserBuilder

  def self.perform fb_token
    self.new(fb_token).perform
  end

  def initialize fb_token
    @fb_token = fb_token
  end

  def perform
    if user.new_record?
      build_user
      user.save
    end
    user
  end

  def graph
    @graph ||= Koala::Facebook::API.new(@fb_token)
  end

  def profile
    @profile ||= graph.get_object("me")
  end

  def user
    @user ||= User.where(facebook_id: profile["id"]).first_or_initialize
  end

  def build_user
    set_name
    set_email
    set_facebook_id
    set_avathar
    set_auth_token
  end

  def set_name
    @user.name = profile["name"]
  end

  def set_email
    @user.email = profile["email"]
  end

  def set_facebook_id
    @user.facebook_id = profile["id"]
  end

  def set_avathar
    @user.avathar_url = graph.get_picture(profile['id'],:type => "large")
  end

  def set_fb_auth_token
    @user.fb_auth_token = @fb_token
  end
end