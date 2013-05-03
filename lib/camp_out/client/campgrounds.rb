module CampOut
  class Client
    module Campgrounds

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

    end
  end
end
