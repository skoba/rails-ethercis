require 'faraday'
class SessionClose < Faraday::Middleware
  def on_complete(env)
#    res = @app.on_complete(env)
    con = Faraday.new(url: 'http://localhost:8888/rest/v1/')
    con.headers = env[:request_headers]
    con.delete 'session'
#    res
  end
end
