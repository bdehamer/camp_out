module CampOut
  module Request

    def get(path, options={})
      response = connection.get do |request|
        request.path = path
        request.params = options.merge(api_key: api_key)
      end

      response.body
    end
  end
end
