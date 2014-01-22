require 'twitter'
Dir[File.dirname(__FILE__) + '/horse/*.rb'].each { |file| require file }

module Horse

  def self.twitter_username
    ENV['TWITTER_USERNAME']
  end

  def self.setup options
    @options = options
  end

  def self.twitter_client
    @client ||= Twitter::REST::Client.new do |config|
                  config.consumer_key        = @options['CONSUMER_KEY']
                  config.consumer_secret     = @options['CONSUMER_SECRET']
                  config.access_token        = @options['ACCESS_TOKEN']
                  config.access_token_secret = @options['ACCESS_TOKEN_SECRET']
                end
  end

  def self.method_to_get_tweets
    @options[:pending_tweets]
  end

  def self.tweet_something_new
    funny_tweet = FunnyTweet.next
    return unless funny_tweet
    Tweeter.tweet funny_tweet
  end

end
