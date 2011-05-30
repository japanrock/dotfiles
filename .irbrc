## use rubygems
require 'rubygems'

## view sql when script/consle
require "active_record"
ActiveRecord::Base.logger = Logger.new(STDOUT)

## https://github.com/michaeldv/awesome_print
require "awesome_print"

unless IRB.version.include?('DietRB')
  IRB::Irb.class_eval do
    def output_value
      ap @context.last_value
    end
  end
else # MacRuby
  IRB.formatter = Class.new(IRB::Formatter) do
    def inspect_object(object)
      object.ai
    end
  end.new
end

## http://doc.okkez.net/static/192/library/irb=2fcompletion.html
require 'irb/completion'

## http://journal.mycom.co.jp/articles/2006/12/22/wirble/index.html
# start wirble (with color)
require 'wirble'
Wirble.init
Wirble.colorize

## http://tagaholic.me/hirb/doc/
# Hirb doesn't use with awesome_print
# require 'hirb'
# Hirb.enable
# $KCODE = 'e'

## http://irb-history.rubyforge.org/rdoc/
# IRB has history function already?
#require 'irb/history'
#IRB::History.start_client
