class User < ApplicationRecord

  acts_as_follower
  acts_as_followable
  acts_as_liker
  acts_as_mentionable

  has_many :watch_lists

  before_create :generate_auth_key

  scope :top_users, -> { order('reviews_count DESC').limit(20) }
  scope :search,-> (name) { where("name like ?", "#{name}%").limit(20) }

  def self.current_user
    Thread.current[:current_user]
  end

  def self.current_user=(user)
    Thread.current[:current_user] = user
  end

  def watch movie
    watch_list = watch_lists.new
    watch_list.movie_id = movie.id
    watch_list.save
  end

  def unwatch movie
    watch_list = watch_lists.where(movie_id: movie.id).first
    watch_list.destroy
  end

  def watched_movies
    watched_movies_id = watch_lists.pluck(:movie_id).uniq
    Movie.where(id: watched_movies_id)
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
