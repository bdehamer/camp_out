require 'faraday_middleware'
require 'camp_out/middleware/raise_error'

module CampOut
  module Connection

    def connection
      request_options = {
        open_timeout: open_timeout,
        timeout: read_timeout
      }

      Faraday.new(url: url, request: request_options) do |f|
        f.response :mashify
        f.response :xml
        f.use CampOut::Middleware::RaiseError
        f.response :logger, logger
        f.adapter adapter
      end
    end
  end
end
