module Horse::Tweeter
  def self.tweet message
    Twitter.client.update message
  end
end

