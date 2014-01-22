require_relative '../test_helper'

describe Horse::PreviouslyMadeTweets do

  it "should return the text of the tweets" do
    twitter_username = Object.new
    client           = Object.new

    Horse.stubs(:twitter_username).returns twitter_username

    tweets = [:text].to_objects { [[Object.new], [Object.new]] }
    client.stubs(:user_timeline).with(twitter_username).returns tweets

    Horse.stubs(:twitter_client).returns client

    results = Horse::PreviouslyMadeTweets.all

    results.count.must_equal 2
    tweets.each { |x| results.include?(x.text).must_equal true }
  end

end
