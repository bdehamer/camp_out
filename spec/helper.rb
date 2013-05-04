require 'rspec'
require 'camp_out'
require 'hashie'

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture_file(file)
  File.new(fixture_path + '/' + file)
end

def json_fixture(file)
  File.read(fixture_file("#{file}.json"))
end

def fixture(file)
  hash = JSON.parse(json_fixture(file))
  Hashie::Mash.new(hash)
end
