require 'helper'

describe CampOut::Configuration do

  context "VALID_OPTIONS_KEYS array" do
    subject { CampOut::Configuration::VALID_OPTIONS_KEYS }

    it "should contain known values" do
      subject.should eql [
        :adapter,
        :url,
        :api_key,
        :open_timeout,
        :read_timeout,
        :logger]
    end
  end
end
