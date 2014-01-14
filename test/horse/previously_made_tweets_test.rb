require_relative '../test_helper'

describe PreviouslyMadeTweets do

  it "should return the text of the tweets" do
    twitter_username = Object.new
    client           = Object.new

    Horse.stubs(:twitter_username).returns twitter_username

    tweets = [:text].to_objects { [[Object.new], [Object.new]] }
    client.stubs(:user_timeline).with(twitter_username).returns tweets

    Twitter.stubs(:client).returns client

    results = PreviouslyMadeTweets.all

    results.count.must_equal 2
    tweets.each { |x| results.include?(x.text).must_equal true }
  end

end
