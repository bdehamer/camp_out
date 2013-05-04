require 'helper'

describe CampOut do

  after do
    CampOut.reset
  end

  describe "configuration options" do

    CampOut::Configuration::VALID_OPTIONS_KEYS.each do |method|
      it "should support #{method}" do
        CampOut.respond_to?(method, false).should be_true
      end
    end
  end

  describe "defaults" do

    it "should default adapter to Faraday default" do
      CampOut.adapter.should be CampOut::Configuration::DEFAULT_ADAPTER
    end

    it "should default url to nil" do
      CampOut.url.should eql CampOut::Configuration::DEFAULT_URL
    end

    it "should default api_key to nil" do
      CampOut.api_key.should be_nil
    end
  end

  describe "configure" do

    it "should allow access to configuration options" do
      CampOut.configure do |config|
        config.api_key = :foo
      end

      CampOut.api_key.should eql(:foo)
    end
  end

end
