class Api::V1::LanguagesController < ApplicationController

  before_action :fetch_language, except: [:index]
  before_action :decorate_language, except: [:index]


  def index
    @languages = Language.all.page(params[:page]).per_page(5)
  end

  def discover
    @discover = DiscoverResponseBuilder.perform(@language)
  end

  def top_movies
    @movies = @language.top_movies(params[:page])
  end

  def new_movies
    @movies = @language.latest_movies(params[:page])
  end

  def top_users
    @users = @language.top_users(params[:page])
  end

  private

    def decorate_language
      @language = LanguageDecorator.new(@language)
    end

    def fetch_language
      @language = Language.find(params[:id] || params[:language_id])
    end

end
