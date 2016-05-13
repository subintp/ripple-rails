class Api::V1::MoviesController < ApplicationController

  before_action :fetch_language, only: [:index, :create]
  before_action :fetch_movie, except: [:create, :index]

  def create
    @movie = @language.movies.new(movie_params)
    @movie.save!
  end

  def index
    @movies = @language.movies.page(params[:page])
  end

  def show
  end


  def follow
    @current_user.follow!(@movie)
    head :ok
  end

  def unfollow
    @current_user.unfollow!(@movie)
    head :ok
  end


  private

  def fetch_language
    @language = Language.find(params[:language_id])
  end

    def fetch_movie
      @movie = Movie.includes(:reviews).find(params[:id])
    end

    def movie_params
      params.require(:movie)
            .permit(:name, :release_date, :director,
                    :cast_list, :image_url, :description,
                    :genre_list, :length, :trailer_id,
                    :source_id, :rotten_rating, :imdb_rating)
            .merge(language_id: @language.id)
    end


end
