class ApplicationController < ActionController::Base

  protect_from_forgery with: :null_session

  respond_to :json

  helper_method :current_user
  before_filter :authenticate!


  def current_user
    return @current_user if @current_user
    auth_key = params[:auth_key] || request.headers['X-TOKEN']
    user = User.find_by_auth_key(auth_key) if auth_key
    @current_user = user
  end

  def authenticate!
    render_unauthorized unless current_user
  end

  def render_unauthorized
    head :unauthorized
  end
end
