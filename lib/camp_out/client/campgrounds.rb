module CampOut
  class Client
    module Campgrounds

      CAMPGROUNDS_PATH = 'campgrounds'

      def list_campgrounds(options={})
        get(CAMPGROUNDS_PATH, options)
      end

    end
  end
end
