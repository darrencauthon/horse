module Horse::Tweeter
  def self.tweet message
    Horse.twitter_client.update message
  end
end

