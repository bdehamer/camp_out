require 'faraday_middleware'

module CampOut
  module Connection

    def connection
      Faraday.new(url: url) do |faraday|
        faraday.response :xml
        faraday.response :mashify
        faraday.adapter adapter
      end
    end
  end
end
