class User < ApplicationRecord

  acts_as_follower
  acts_as_followable
  acts_as_liker
  acts_as_mentionable

  before_create :generate_auth_key

  scope :top_users, -> { order('reviews_count DESC').limit(20) }
  scope :search,-> (name) { where("name like ?", "#{name}%").limit(20) }

  private

  def generate_auth_key
    self.auth_key = random_token
  end

  def random_token
    token = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless User.exists?(auth_key: random_token)
    end
  end


end
