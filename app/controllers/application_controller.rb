class ApplicationController < ActionController::Base

  protect_from_forgery with: :null_session

  respond_to :json

  helper_method :current_user
  before_action :authenticate!
  around_action :wrap_in_rescue


  private

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

  def wrap_in_rescue
    set_current_user
    begin
      yield
    rescue  => e
      # TODO - send error to new relic
      head :internal_server_error
    end
  end

  def set_current_user
    User.current_user = current_user
  end

end
