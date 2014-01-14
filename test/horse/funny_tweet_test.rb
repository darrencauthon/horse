require_relative '../test_helper'

describe FunnyTweet do

  describe "determining the next tweet" do

    describe "when no tweets have been made previously" do

      before do
        PreviouslyMadeTweets.stubs(:all).returns []
      end

      describe "no pending tweets exist" do

        it "should return nil" do
          PendingTweets.stubs(:all).returns []
          FunnyTweet.next.nil?.must_equal true
        end

      end

      describe "pending tweets exist" do

        it "should return a random result" do
          expected_result = Object.new

          array = [1, 2, 3]
          array.stubs(:sample).returns expected_result

          PendingTweets.stubs(:all).returns array

          FunnyTweet.next.must_be_same_as expected_result
        end

      end

    end

    describe "when tweets have been made previously" do

      ['a', 'b', 'c'].each do |tweet|

        describe "when one tweet exists that has been tweeted before" do

          it "should return nothing" do
            PendingTweets.stubs(:all).returns [tweet]
            PreviouslyMadeTweets.stubs(:all).returns [tweet]

            FunnyTweet.next.nil?.must_equal true
          end

        end

        describe "when one tweet exists that has not been tweeted before" do

          it "should return nothing" do
            PendingTweets.stubs(:all).returns [tweet]
            PreviouslyMadeTweets.stubs(:all).returns [tweet + '.']

            FunnyTweet.next.must_equal tweet
          end

        end

      end

      describe "when multiple results and matches exist" do
        it "should return a sample of the tweets that have not been tweeted before" do

          PendingTweets.stubs(:all).returns ['a', 'b', 'c', 'd']
          PreviouslyMadeTweets.stubs(:all).returns ['a', 'z', 'c', 'y']


          matches = []
          (1..1000).each do
            result = FunnyTweet.next
            ['b', 'd'].include?(result).must_equal true
            matches << result
          end

          matches.group_by { |x| x }.map { |x| x[0] }.sort_by { |x| x }.must_equal ['b', 'd']
        end

      end

    end

  end

end
