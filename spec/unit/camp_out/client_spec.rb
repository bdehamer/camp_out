require 'helper'

describe CampOut::Client do

  let(:response) { double(:response) }

  before do
    subject.stub(get: response)
  end

  describe "#list_campgrounds" do

    let(:options) { { foo: :bar } }

    it "issues a get against the campgrounds resource" do
      subject.should_receive(:get).with('campgrounds', options)
      subject.list_campgrounds(options)
    end

    it "returns the response from the API call" do
      subject.list_campgrounds(options).should eql response
    end
  end

  describe "#get_campground" do

    let(:contract_code) { 'cc123' }
    let(:park_id) { 'p456' }

    it "issues a get against the campground/details resource" do
      subject.should_receive(:get).with('campground/details', {
        contractCode: contract_code,
        parkId: park_id
      })
      subject.get_campground(contract_code, park_id)
    end

    it "returns the response from the API call" do
      subject.get_campground(contract_code, park_id).should eql response
    end
  end

  describe "#list_campsites" do

    let(:contract_code) { 'cc123' }
    let(:park_id) { 'p456' }
    let(:options) { { foo: :bar } }

    it "issues a get against the camping/campsites resource" do
      subject.should_receive(:get).with('campsites', {
        foo: :bar,
        contractCode: contract_code,
        parkId: park_id
      })
      subject.list_campsites(contract_code, park_id, options)
    end

    it "returns the response from the API call" do
      subject.list_campsites(contract_code, park_id, options).should eql response
    end
  end
end
