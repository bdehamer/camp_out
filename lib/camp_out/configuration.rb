require 'faraday'
require 'logger'

module CampOut
  module Configuration

    VALID_OPTIONS_KEYS = [
      :adapter,
      :url,
      :api_key,
      :open_timeout,
      :read_timeout,
      :logger
    ]

    DEFAULT_ADAPTER = Faraday.default_adapter

    attr_accessor(*VALID_OPTIONS_KEYS)

    def self.extended(base)
      base.reset
    end

    def options
      VALID_OPTIONS_KEYS.inject({}) { |o,k| o.merge!(k => send(k)) }
    end

    def reset
      self.adapter = DEFAULT_ADAPTER
      self.url = 'http://api.amp.active.com/camping'
      self.api_key = nil
      self.open_timeout = 2
      self.read_timeout = 5
      self.logger = ::Logger.new(STDOUT)
    end
  end
end
