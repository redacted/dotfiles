# load Ruby Gems and Wirble
require 'rubygems'
#require 'what_methods'
require 'pp'
require 'irb/completion'
ARGV.concat [ "--readline", "--prompt-mode", "classic" ]

IRB.conf[:AUTO_INDENT]=true
IRB.conf[:PROMPT_MODE]=:CLASSIC

# Readline-enable prompts.
require 'irb/ext/save-history'
IRB.conf[:USE_READLINE] = true
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_PATH] = File::expand_path("~/.irb.history")

