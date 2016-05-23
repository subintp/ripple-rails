class Api::V1::UsersController < ApplicationController

  def login
    begin
      @user = UserBuilder.perform(params[:auth_token])
    rescue  => e
      Rails.logger.info "USER-CREATION-FAILED - #{e.message}"
      head :internal_server_error
    end
  end

end
