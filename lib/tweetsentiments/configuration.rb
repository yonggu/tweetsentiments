require 'faraday'
require File.expand_path('../version', __FILE__)
module Tweetsentiments
  module Configuration
    VALID_OPTIONS_KEYS = [:endpoint, :format, :user_agent, :proxy, :adapter].freeze
    VALID_FORMATS = [:json, :xml].freeze

    DEFAULT_FORMAT = :json.freeze
    DEFAULT_ENDPOINT = 'http://api.tweetsentiments.com/api/'.freeze
    DEFAULT_USER_AGENT = "Tweetsentiments Ruby Gem #{Tweetsentiments::VERSION}".freeze
    DEFAULT_PROXY = nil.freeze
    DEFAULT_ADAPTER = Faraday.default_adapter.freeze
    attr_accessor *VALID_OPTIONS_KEYS
    
    def self.extended(base)
      base.reset
    end

    def configure
      yield self
    end

    def options
      VALID_OPTIONS_KEYS.inject({}) do |option, key|
        option.merge!(key => send(key))
      end
    end

    def reset
      self.endpoint = DEFAULT_ENDPOINT
      self.format = DEFAULT_FORMAT
      self.user_agent = DEFAULT_USER_AGENT
      self.proxy = DEFAULT_PROXY
      self.adapter = DEFAULT_ADAPTER
    end
  end
end
