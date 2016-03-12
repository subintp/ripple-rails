class Api::V1::AuthenticationController < ApplicationController

  def facebook
    begin
      @user = UserBuilder.perform(params[:auth_token])
    rescue  => e
      Rails.logger.info "USER-CREATION_FAILED - #{e.message}"
      head :internal_server_error
    end
  end

end
