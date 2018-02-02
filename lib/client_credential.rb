require 'faraday'

class ClientCredential < Faraday::Middleware
  def call(env)
    env[:request_headers]['Ehr-Session'] = AccessToken.get
    @app.call(env)
  end
end
