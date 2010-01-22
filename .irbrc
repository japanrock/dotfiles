require 'rubygems'
require 'irb/completion'

# view sql when script/consle
require "active_record"
ActiveRecord::Base.logger = Logger.new(STDOUT)

# http://irb-history.rubyforge.org/rdoc/
require 'irb/history'
IRB::History.start_client
