class Api::V1::CommentsController < ApplicationController

  before_action :fetch_review, except: [:destroy]
  before_action :fetch_comment, only: [:destroy]

  def index
    @comments = @review.comments
  end

  def create
    create_comment
  end

  def destroy
    @comment.destroy
    head :ok
  end

  private

  def fetch_review
    @review = Review.includes(:movie).find(params[:review_id])
  end

  def fetch_comment
    @comment = Comment.find(params[:id])
  end

  def create_comment
    #TODO - Move this to comment builder
    @comment = @review.comments.build
    @comment.content = params[:content]
    @comment.review_id = @review.id
    @comment.user_id = @current_user.id
    @comment.movie_id = @review.movie_id
    @comment.save!
  end

end
