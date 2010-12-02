module Tweetsentiments
  class Base
    def client(options={})
      Tweetsentiments::Client.new(options)
    end
  end
end
