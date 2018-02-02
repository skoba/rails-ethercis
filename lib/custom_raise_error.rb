class CustomRaiseError < Faraday::Response::RaiseError
  def on_complete(env)
    case env[:status]
    when 403
      raise UnauthorizedError, response_values(env)
    when ClientErrorStatus
      raise Faraday::Error::ClientError, response_values(env)
    end
    parse_body(env[:body])
  end

  def parse_body(body)
    if body.nil?
      nil
    else
      MultiJson.load(body)
    end
  end
  class UnauthorizedError < Faraday::ClientError; end
end

