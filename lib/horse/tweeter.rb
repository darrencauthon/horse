module Horse
  module Tweeter
    def self.tweet message
      Horse.twitter_client.update message
    end
  end
end
