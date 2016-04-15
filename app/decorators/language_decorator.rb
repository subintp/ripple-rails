class LanguageDecorator < BaseDecorator

  def initialize(language)
    @object = language
  end

   def top_movies(page=1)
    @object.movies.top.page(page)
   end

   def latest_movies(page=1)
    @object.movies.latest.page(page)
   end

   def top_users
   end

end
