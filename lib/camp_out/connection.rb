require 'faraday_middleware'

module CampOut
  module Connection

    def connection
      request_options = {
        open_timeout: open_timeout,
        timeout: read_timeout
      }

      Faraday.new(url: url, request: request_options) do |f|
        f.response :xml
        f.response :mashify
        f.response :logger, logger
        f.adapter adapter
      end
    end
  end
end
