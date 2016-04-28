class User < ApplicationRecord

  before_create :generate_auth_key

  scope :top_users, -> { order('reviews_count DESC').limit(20) }


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
