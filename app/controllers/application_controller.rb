require "application_responder"

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  self.responder = ApplicationResponder
  respond_to :html

  def configure_permitted_parameters
    devise_parameter_sanitezer.permit(:sign_up, keys: [:username])
end
