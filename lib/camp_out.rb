require 'camp_out/configuration'
require 'camp_out/client'

module CampOut
  extend Configuration

  def self.new(options={})
    CampOut::Client.new(options)
  end

  def self.configure
    yield self
    true
  end
end
