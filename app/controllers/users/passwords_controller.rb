# frozen_string_literal: true

class Users::PasswordsController < Devise::PasswordsController
  skip_after_action :verify_authorized
end
