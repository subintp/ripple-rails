class Api::V1::WatchListController < ApplicationController

  before_action :fetch_movie

  def add
    add_to_watch_list
  end

  def remove
    WatchList.find_by_movie_id(@movie.id)
    head :ok
  end

  private

  def fetch_movie
    @movie = Movie.find(params[:movie_id])
  end

  def add_to_watch_list
    @watch_list_movie = @current_user.watch_lists.build
    @watch_list_movie.movie_id = @movie.id
    @watch_list_movie.save!
  end

end
