module Api
  class ApiController < ActionController::API
    include ApiResponse
    include ApiExceptionHandler
  end
end
