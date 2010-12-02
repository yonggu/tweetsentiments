require File.expand_path('../../spec_helper', __FILE__)

describe Tweetsentiments::Client do
  Tweetsentiments::Configuration::VALID_FORMATS.each do |format|
    context ".new(:format => '#{format}')" do
      before do
        @text = "I am happy"
        @client = Tweetsentiments::Client.new(:format => format)
      end
    
      describe ".classify(#{@text})" do
        before do
          @text = "I am happy"
          stub_get("classify.#{format}").
            with(:query => {:text => @text}).
            to_return(:body => fixture("classify.#{format}"), :headers => {:content_type => "application/#{format}; charset=utf-8"})
        end
        it "should get the correct resource" do
          @client.classify(@text)
          a_get("classify.#{format}").
            with(:query => {:text => @text}).
            should have_been_made
        end
      end
      
      describe ".classify_simple(#{@text})" do
        before do
          @text = "I am happy"
          stub_get("classify_simple.#{format}").
            with(:query => {:text => @text}).
            to_return(:body => fixture("classify.#{format}"), :headers => {:content_type => "application/#{format}; charset=utf-8"})
        end
        it "should get the correct resource" do
          @client.classify_simple(@text)
          a_get("classify_simple.#{format}").
            with(:query => {:text => @text}).
            should have_been_made
        end
      end
    end
  end
end
