require_relative '../test_helper'

describe PendingTweets do
  it "should return something" do
    (PendingTweets.all.count > 0).must_equal true
  end

  it "should strip all of the values" do
    PendingTweets.all.each do |tweet|
      tweet.strip.must_equal tweet
    end
  end
end
