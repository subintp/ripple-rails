class DiscoverResponseBuilder

  def self.perform language
    self.new(language).perform
  end

  def initialize language
    @language = language
  end

  def perform
    {
      new: @language.latest_movies,
      top: @language.top_movies,
      top_users: User.top_users
    }
  end

end