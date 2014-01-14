require_relative '../test_helper'

describe Horse::PendingTweets do
  it "should return something" do
    (Horse::PendingTweets.all.count > 0).must_equal true
  end

  it "should strip all of the values" do
    Horse::PendingTweets.all.each do |tweet|
      tweet.strip.must_equal tweet
    end
  end
end
