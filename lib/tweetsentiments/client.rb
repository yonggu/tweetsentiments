module Tweetsentiments
  class Client < API
    def classify(text, options={})
      response = get("classify", options.merge(:text => text))
    end
    def classify_simple(text, options={})
      response = get("classify_simple", options.merge(:text => text))
    end
  end
end
