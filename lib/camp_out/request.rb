module CampOut
  module Request

    def get(path, options={})
      response = connection.get do |request|
        request.options[:open_timeout] = open_timeout
        request.options[:timeout] = read_timeout
        request.path = URI.escape(path)
        request.params = options.merge(api_key: api_key)
      end

      response.body
    end
  end
end
