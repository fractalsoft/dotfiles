require 'pp'
require 'yaml'
require 'irb/completion'
require 'irb/ext/save-history'
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"
# IRB.conf[:AUTO_INDENT] = true
# IRB.conf[:PROMPT_MODE] = :SIMPLE
