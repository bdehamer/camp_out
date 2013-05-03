require 'camp_out/connection'
require 'camp_out/request'

require 'camp_out/client/campgrounds'

module CampOut
  class Client

    attr_accessor(*Configuration::VALID_OPTIONS_KEYS)

    def initialize(options={})
      options = CampOut.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end

    include CampOut::Connection
    include CampOut::Request

    include CampOut::Client::Campgrounds
  end
end
