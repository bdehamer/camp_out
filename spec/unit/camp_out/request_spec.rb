require 'helper'

describe CampOut::Request do

  let(:api_key) { 'key123' }

  let(:path) { '/path' }

  let(:request) {
    double(:request, options: {}, params: {}, params: {}, 
           'params=' => nil, 'path=' => nil)
  }

  let(:response) { double(:response, body: :foo) }

  let(:connection) { double(:connection, to_sym: :conn) }

  subject { CampOut::Client.new(api_key: api_key) }

  before do
    connection.stub(:get).and_yield(request).and_return(response)
    subject.stub(connection: connection)
  end

  describe "#get" do

    it "should set the path" do
      request.should_receive(:path=).with(path)
      subject.get(path)
    end

    it "should return the response" do
      subject.get(path).should eql response.body
    end

    context "when options are provided" do

      let(:options) { { a: :b } }

      it "should handle the options parameter and API key" do
        request.should_receive(:params=).with(options.merge(api_key: api_key))
        subject.get(path, options)
      end
    end

    context "when no options are provided" do

      it "should still pass along the API key" do
        request.should_receive(:params=).with(api_key: api_key)
        subject.get(path)
      end
    end
  end

end
