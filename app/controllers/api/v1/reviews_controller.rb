class Api::V1::ReviewsController < ApplicationController

  before_action :fetch_movie, only: [:index, :create]
  before_action :fetch_review, except: [:index, :create]


  def index
    @reviews = @movie.reviews
  end

  def create
    @review = @movie.reviews.new(review_params)
    @review.save
  end

  def show
  end

  def update
    @review.update_attributes(review_params)
    render 'show'
  end

  def like
    @current_user.toggle_like!(@review)
  end

  def destroy
    @review.destroy
    head :ok
  end

  private

  def fetch_movie
    @movie = Movie.find(params[:movie_id])
  end

  def fetch_review
    @review = Review.includes(:comments, :user).find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end

end
