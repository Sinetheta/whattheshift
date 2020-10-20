class ApplicationController < ActionController::Base
  include Pundit
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index

  protect_from_forgery with: :reset_session
end
