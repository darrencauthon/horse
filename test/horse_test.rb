require_relative 'test_helper'

describe Horse do

  describe "setting up" do
    it "should be able to pull a twitter client" do
      Horse.setup({})
      Horse.twitter_client.is_a?(Twitter::REST::Client).must_equal true
    end

    it "should pass the pending tweets as a block" do
      method = Object.new
      Horse.setup( { pending_tweets: method } )
      Horse.method_to_get_tweets.must_be_same_as method
    end

    it "should pass the twitter username" do
      username = Object.new
      Horse.setup( { twitter_username: username } )
      Horse.twitter_username.must_be_same_as username
    end
  end

  describe "tweeting something new" do

    describe "a new funny tweet exists" do

      it "should tweet it" do
        funny_tweet = Object.new

        Horse::FunnyTweet.stubs(:next).returns funny_tweet
        Horse::Tweeter.expects(:tweet).with funny_tweet

        Horse.tweet_something_new
      end

    end

    describe "no funny tweet exists" do

      it "should not tweet it" do
        Horse::FunnyTweet.stubs(:next).returns nil
        Horse::Tweeter.expects(:tweet).never

        Horse.tweet_something_new
      end

    end

  end

end
