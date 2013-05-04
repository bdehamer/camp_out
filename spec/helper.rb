require 'simplecov'
#require 'simplecov-rcov'
#SimpleCov.formatter = SimpleCov::Formatter::RcovFormatter
SimpleCov.start do
  add_filter '/spec'
end
require 'camp_out'
require 'hashie'
require 'rspec'

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
