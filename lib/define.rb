require 'wordnik'
require 'cinch'

class Define
  include Cinch::Plugin


  Wordnik.configure do |config|
    config.api_key = '2ce088ca7c16069588a150b21a204f3bc266b7a0237fa62e0'
  end
  
  match /def (.+)/

  def define(word)
    defs = Wordnik.word.get_definitions(
      word,
      :limit => 1
    )
    defs && defs[0] && defs[0]['text'] ?
      defs[0]['text'] : "No result found!"
    
  end

  def execute(m, word)
    definition = define word
    m.reply "#{m.user.nick}: #{definition}"
  end
end

