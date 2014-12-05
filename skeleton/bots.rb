require 'twitter_ebooks'

# This is an example bot definition with event handlers commented out
# You can define and instantiate as many bots as you like

class MyBot < Ebooks::Bot
  # Configuration here applies to all MyBots
  def configure
    # Consumer details come from registering an app at https://dev.twitter.com/
    # Once you have consumer details, use "ebooks auth" for new access tokens
    self.consumer_key = '' # Your app consumer key
    self.consumer_secret = '' # Your app consumer secret

    # Users to block instead of interacting with
    self.blacklist = ['tnietzschequote']

    # Range in seconds to randomize delay when bot.delay is called
    self.delay_range = 1..6
  end

  def on_startup
    scheduler.every '24h' do
      # Tweet something every 24 hours
      # See https://github.com/jmettraux/rufus-scheduler
      # bot.tweet("hi")
      # bot.pictweet("hi", "cuteselfie.jpg")
    end
  end

  def on_message(dm)
    # Reply to a DM
    # bot.reply(dm, "secret secrets")
  end

  def on_follow(user)
    # Follow a user back
    # bot.follow(user[:screen_name])
  end

  def on_mention(tweet)
    # Reply to a mention
    # bot.reply(tweet, meta(tweet)[:reply_prefix] + "oh hullo")
  end

  def on_timeline(tweet)
    # Reply to a tweet in the bot's timeline
    # bot.reply(tweet, meta(tweet)[:reply_prefix] + "nice tweet")
  end
end

# Make a MyBot and attach it to an account
MyBot.new("{{BOT_NAME}}") do |bot|
  bot.access_token = "" # Token connecting the app to this account
  bot.access_token_secret = "" # Secret connecting the app to this account
end
