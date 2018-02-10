# require Rails.root.join( 'lib/client_credential')
# #require Rails.root.join( 'lib/session_close')
# require Rails.root.join('lib/custom_raise_error')

# Her::API.setup url: "http://localhost:8888/rest/v1/" do |c|
#   # Request
#   c.use Faraday::Request::UrlEncoded
# #  c.use Faraday::Request::Retry, max: 1, interval: 0.05,
# #                                 interval_randomness: 0.5, backoff_factor: 2,
# #                                 exceptions: [CustomRaiseError::UnauthorizedError]
# #  c.use ClientCredential

#   # Response
# #  c.use Faraday::Middleware::Logger
#   c.use Her::Middleware::DefaultParseJSON
# #  c.use SessionClose
#   # Adapter
#   c.use Faraday::Adapter::HTTPClient
# end
