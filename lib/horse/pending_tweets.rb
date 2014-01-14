module Horse::PendingTweets
  def self.all
    IO.readlines("upcoming_tweets.txt").map { |x| x.strip }
  end
end

