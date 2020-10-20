class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :reset_session
end
