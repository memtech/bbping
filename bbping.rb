require 'cinch'

Dir["./lib/plugin/*.rb"].each {|file| require file }

bot = Cinch::Bot.new do
  configure do |config|
    config.server          = "irc.freenode.org"
    config.channels        = ['#geekblogtv']
    config.plugins.plugins = [Define]
    config.nick            = 'BBPing'
  end
end

bot.start
