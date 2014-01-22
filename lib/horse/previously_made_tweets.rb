module Horse
  module PreviouslyMadeTweets
    def self.all
      Horse.twitter_client.user_timeline(Horse.twitter_username)
        .map { |x| x.text }
    end
  end
end
