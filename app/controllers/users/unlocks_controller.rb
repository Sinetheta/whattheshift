# frozen_string_literal: true

class Users::UnlocksController < Devise::UnlocksController
  skip_after_action :verify_authorized
end
