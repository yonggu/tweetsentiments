require File.expand_path('../../lib/tweetsentiments', __FILE__)
require 'rubygems'
require 'rspec'
require 'webmock/rspec'
# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}
Rspec.configure do |config|
  config.include WebMock::API
end
Tweetsentiments.configure do |config|
  #config.endpoint = "http://www.text.com"
end
def fixture_path
  File.expand_path("../fixtures", __FILE__)
end
def fixture(file)
  File.new(fixture_path + "/" + file)
end
def a_get(path)
  a_request(:get, Tweetsentiments.endpoint + path)
end
def stub_get(path)
  stub_request(:get, Tweetsentiments.endpoint + path)
end
