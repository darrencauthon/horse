module Horse::PendingTweets
  def self.all
    Horse.method_to_get_tweets.call.map { |x| x.strip }
  end
end

