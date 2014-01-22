require 'twitter'
Dir[File.dirname(__FILE__) + '/horse/*.rb'].each { |file| require file }

module Horse

  def self.setup options
    @options = options
  end

  def self.tweet_something_new
    funny_tweet = FunnyTweet.next
    return unless funny_tweet
    Tweeter.tweet funny_tweet
  end

  def self.twitter_client
    @client ||= Twitter::REST::Client.new do |config|
                  config.consumer_key        = @options[:consumer_key]
                  config.consumer_secret     = @options[:consumer_secret]
                  config.access_token        = @options[:access_token]
                  config.access_token_secret = @options[:access_token_secret]
                end
  end

  def self.twitter_username
    @options[:twitter_username]
  end

  def self.method_to_get_tweets
    @options[:pending_tweets]
  end

end
