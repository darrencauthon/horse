require_relative 'test_helper'

describe Horse do

  describe "twitter username" do
    it "should pull from the ENV twitter_username" do
      username = Object.new
      ENV.stubs(:[]).with('TWITTER_USERNAME').returns username
      Horse.twitter_username.must_be_same_as username
    end
  end

  describe "setting up" do
    it "should blkjsd" do
      Horse.setup
      Twitter.client.is_a?(Twitter::REST::Client).must_equal true
    end
  end

  describe "tweeting something new" do

    describe "a new funny tweet exists" do

      it "should tweet it" do
        funny_tweet = Object.new

        FunnyTweet.stubs(:next).returns funny_tweet
        Tweeter.expects(:tweet).with funny_tweet

        Horse.tweet_something_new
      end

    end

    describe "no funny tweet exists" do

      it "should not tweet it" do
        FunnyTweet.stubs(:next).returns nil
        Tweeter.expects(:tweet).never

        Horse.tweet_something_new
      end

    end

  end

end
