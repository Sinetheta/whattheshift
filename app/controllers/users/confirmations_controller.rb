# frozen_string_literal: true

class Users::ConfirmationsController < Devise::ConfirmationsController
  skip_after_action :verify_authorized
end
