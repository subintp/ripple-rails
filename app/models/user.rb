class User < ApplicationRecord

  acts_as_follower
  acts_as_followable
  acts_as_liker
  acts_as_mentionable

  has_many :watch_lists, dependent: :destroy
  has_many :watched_lists, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy

  acts_as_follower
  acts_as_followable
  acts_as_liker
  acts_as_mentionable

  before_create :generate_auth_key

  scope :top_users, -> { order('reviews_count DESC').limit(20) }
  scope :search,-> (name) { where("name like ?", "#{name}%").limit(20) }

  def self.current_user
    Thread.current[:current_user]
  end

  def self.current_user=(user)
    Thread.current[:current_user] = user
  end

  def followees_reviews(review_id,order)
    reviews = Review.where(user_id: self.followees(User).map(&:id))
    results = {}
    if order == :latest
      if review_id
        results = reviews.where('id > ?',review_id).order('id DESC').limit(10)
      else
        results = reviews.order('id DESC').limit(15)
      end
    else order == :oldest
      if review_id
        results = reviews.where('id < ?',review_id).order('id DESC').limit(10)
      else
        results = reviews.limit(15)
      end
    end
    results
  end

  def user_reviews(review_id,order)
    #reviews = Review.where(id: self.id)
    reviews = self.reviews
    results = {}
    if order == :latest
      if review_id
        results = reviews.where('id > ?',review_id).order('id DESC').limit(10)
      else
        results = reviews.order('id DESC').limit(10)
      end
    else order == :oldest
      if review_id
        results = reviews.where('id < ?',review_id).order('id DESC').limit(10)
      else
        results = reviews.limit(10)
      end
    end
    results
  end

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
