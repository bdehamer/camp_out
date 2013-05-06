require 'helper'
require 'uri'

describe CampOut::Connection do

  context "configuration options" do

    let(:url) { 'https://campout.com' }
    let(:open_timeout) { 100 }
    let(:read_timeout) { 200 }

    subject do
      CampOut::Client.new({ url: url, open_timeout: open_timeout,
                          read_timeout: read_timeout }).connection
    end

    its(:scheme) { should eql URI(url).scheme }

    its(:host) { should eql URI(url).host }

    it { subject.options[:open_timeout].should eql open_timeout }

    it { subject.options[:timeout].should eql read_timeout }
  end

  context "middleware setup" do

    subject { CampOut::Client.new.connection }

    handlers = [
      FaradayMiddleware::ParseXml,
      FaradayMiddleware::Mashify,
      Faraday::Response::Logger,
      CampOut::Middleware::RaiseError,
      Faraday::Adapter::NetHttp]

    handlers.each do |handler|
       it { subject.builder.handlers.should include(handler) }
    end

    it { subject.builder.handlers.count.should eql handlers.count }
  end
end
