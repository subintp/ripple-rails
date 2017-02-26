class Api::V1::UsersController < ApplicationController
  before_action :fetch_user, only: [:show]
  def login
    begin
      @user = UserBuilder.perform(params[:auth_token])
    rescue  => e
      Rails.logger.info "USER-CREATION-FAILED - #{e.message}"
      head :internal_server_error
    end
  end

  def feed
    begin
      @reviews = @current_user.followees_reviews(params[:id], params[:order].to_sym)
      render "api/v1/reviews/index"
    rescue  => e
      head :bad_request
    end
  end

  def show
    begin
      @reviews = @user.user_reviews(params[:id], params[:order].to_sym)
      @watchlist_movies = @user.watch_lists.includes(:movie).page(1).per(7)
    rescue  => e
      head :bad_request
    end
  end


  private

  def fetch_user

    begin
      @user = User.find(params[:id])
    rescue => e
      head :bad_request
    end
  end
end
