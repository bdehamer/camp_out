module CampOut
  module Middleware

    class RaiseError < Faraday::Response::Middleware

      def on_complete(env)

        case env[:status].to_i
        when 400
          raise CampOut::BadRequest.new(env.to_s)
        when 403
          case env[:response_headers]['x-mashery-error-code']
          when 'ERR_403_NOT_AUTHORIZED'
            raise CampOut::NotAuthorized.new(env.to_s)
          when 'ERR_403_DEVELOPER_INACTIVE'
            raise CampOut::AccountInactive.new(env.to_s)
          else
            raise CampOut::RateLimitExceeded.new(env.to_s)
          end
        when 414
          raise CampOut::RequestUriTooLong.new(env.to_s)
        when 503
          raise CampOut::ServiceUnavailale.new(env.to_s)
        end
      end

    end
  end
end
