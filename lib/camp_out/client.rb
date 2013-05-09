require 'camp_out/connection'
require 'camp_out/request'
require 'camp_out/errors'

module CampOut
  class Client

    include CampOut::Connection
    include CampOut::Request

    attr_accessor(*Configuration::VALID_OPTIONS_KEYS)

    def initialize(options={})
      # merge any options set on the CampOut module
      options = CampOut.options.merge(options)

      # set specified options on the appropriate attrs
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end

    ### API Wrappers

    def list_campgrounds(options={})
      get('campgrounds', options)
    end

    def get_campground(contract_code, park_id)
      options = {
        contractCode: contract_code,
        parkId: park_id
      }

      get('campground/details', options)
    end

    def list_campsites(contract_code, park_id, options={})
      options.merge!({
        contractCode: contract_code,
        parkId: park_id
      })

      get('campsites', options)
    end
  end
end
