module CampOut

  class CampOutError < StandardError; end

  class BadRequest < StandardError; end
  class NotAuthorized < StandardError; end
  class AccountInactive < StandardError; end
  class RateLimitExceeded < StandardError; end
  class RequestUriTooLong < StandardError; end
  class ServiceUnavailable < StandardError; end
end
