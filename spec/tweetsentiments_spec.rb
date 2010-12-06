require File.expand_path('../spec_helper', __FILE__)

describe Tweetsentiments do
  describe ".client" do
    it "should be a Tweetsentiments::Client" do
      Tweetsentiments.client.should be_a Tweetsentiments::Client
    end
  end
  describe ".configure" do
    Tweetsentiments::Configuration::VALID_OPTIONS_KEYS.each do |key|
      it "should set the #{key}" do
        Tweetsentiments.configure do |config|
          config.send("#{key}=", key)
          Tweetsentiments.send(key).should == key
        end
      end
    end
  end
end
