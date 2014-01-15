require_relative '../test_helper'

describe Horse::Tweeter do

  describe "tweet" do

    it "should pass the tweet to the Twitter client update" do

      tweet = Object.new

      client = Object.new
      client.expects(:update).with tweet

      Horse.expects(:twitter_client).returns client

      Horse::Tweeter.tweet tweet

    end

  end

end
