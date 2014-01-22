module Horse
  module PendingTweets
    def self.all
      Horse.method_to_get_tweets.call.map { |x| x.strip }
    end
  end
end

