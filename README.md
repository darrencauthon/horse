# Horses

[![Build Status](https://travis-ci.org/darrencauthon/horse.png?branch=master)](https://travis-ci.org/darrencauthon/horse)
[![Code Climate](https://codeclimate.com/github/darrencauthon/horse.png)](https://codeclimate.com/github/darrencauthon/horse)
[![Coverage Status](https://coveralls.io/repos/darrencauthon/horse/badge.png?branch=master)](https://coveralls.io/r/darrencauthon/horse)

Tweet things on twitter.

## Usage

````ruby
options = {
            consumer_key:        'your twitter consumer key',
            consumer_secret:     'your twitter consumer secret',
            access_token:        'your twitter access token',
            access_token_secret: 'your twitter access token secret',
            twitter_username:    'your twitter username',
            pending_tweets:      -> { ["here's one tweet",
                                       "here's another tweet"] }
          }
Horse.setup(options)

# this will tweet one of the pending tweets
# that have not been tweeted previously
Horse.tweet_something_new
````

## Installation

Add this line to your application's Gemfile:

    gem 'horse'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install horse

## Contributing

1. Fork it ( http://github.com/<my-github-username>/horse/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
