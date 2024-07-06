require "application_responder"

class ApplicationController < ActionController::Base
  before_action :authenticate_user!, only: [:new, :create]
  before_action :configure_permitted_parameters, if: :devise_controller?

  self.responder = ApplicationResponder
  respond_to :html

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end
end
