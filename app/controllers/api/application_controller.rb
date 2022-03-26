class Api::ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  rescue_from CanCan::AccessDenied do |_exception|
    head :forbidden
  end
end
