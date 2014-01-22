require_relative '../test_helper'

describe Horse::PendingTweets do

  describe 'one example' do

    let(:tweets) { ['one'] }

    before do
      method = -> { tweets }
      Horse.stubs(:method_to_get_tweets).returns method
    end

    it "should return the tweets" do
      Horse::PendingTweets.all.must_equal tweets
    end
  end

  describe 'another example' do

    let(:tweets) { ['one', 'two', 'three'] }

    before do
      method = -> { tweets }
      Horse.stubs(:method_to_get_tweets).returns method
    end

    it "should return the tweets" do
      Horse::PendingTweets.all.must_equal tweets
    end
  end

  describe "example with extra whitespace" do

    let(:tweets) { [' one ', '    two ', "\tthree\n\n\n"] }

    before do
      method = -> { tweets }
      Horse.stubs(:method_to_get_tweets).returns method
    end

    it "should return the tweets" do
      Horse::PendingTweets.all.must_equal ['one', 'two', 'three']
    end
  end
end
