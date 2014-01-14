module FunnyTweet
  def self.next
    results = PendingTweets.all

    previously_made_tweets = PreviouslyMadeTweets.all
    if previously_made_tweets.count > 0
      results = results.reject { |x| previously_made_tweets.include? x }
    end
    results.sample
  end
end

