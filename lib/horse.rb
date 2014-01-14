require 'twitter'
Dir[File.dirname(__FILE__) + '/horse/*.rb'].each { |file| require file }

module Horse

  def self.twitter_username
    ENV['TWITTER_USERNAME']
  end

  def self.setup
    Twitter.instance_eval do
      def self.client
        Twitter::REST::Client.new do |config|
          config.consumer_key        = ENV['CONSUMER_KEY']
          config.consumer_secret     = ENV['CONSUMER_SECRET']
          config.access_token        = ENV['ACCESS_TOKEN']
          config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
        end
      end
    end
  end

  def self.tweet_something_new
    funny_tweet = FunnyTweet.next
    return unless funny_tweet
    Tweeter.tweet funny_tweet
  end

end
