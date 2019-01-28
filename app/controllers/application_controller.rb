class ApplicationController < ActionController::API
  # hook into JWTSessions
  include JWTSessions::RailsAuthorization
  rescue_from JWTSessions::Errors::Unauthorized, with :not_authorized

  #Private method to rescue Unauthorized errors
  private
    #method to access current user
    def current_user
      @current_user ||= User.find(payload['user_id'])
    end

    def not_authorized
      render json: { error: 'Not Authorized' }, status: :unauthorized
    end
end
