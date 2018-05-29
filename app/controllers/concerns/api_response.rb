module ApiResponse
  def json_response(object, status = :ok, options = {})
    render({ json: object, status: status }.merge(options))
  end
end
