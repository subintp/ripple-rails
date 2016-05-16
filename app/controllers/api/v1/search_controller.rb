class Api::V1::SearchController < ApplicationController

  def movies
    @movies = Movie.search(params[:name])
  end

  def users
    @users = User.search(params[:name])
  end

end
