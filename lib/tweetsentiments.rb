require File.expand_path('../tweetsentiments/configuration', __FILE__)
require File.expand_path('../tweetsentiments/api', __FILE__)
require File.expand_path('../tweetsentiments/client', __FILE__)

module Tweetsentiments
  extend Configuration
  def self.client(options={})
    Tweetsentiments::Client.new(options)
  end
  def self.method_missing(method, *args, &block)
    return super unless client.respond_to?(method)
    client.send(method, *args, &block)
  end
end
