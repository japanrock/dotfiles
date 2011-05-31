## for config check
begin

## setup start -------------------------------------------------------------------------------


## IRB Manual
# http://www.ruby-lang.org/ja/man/html/irb.html

## use rubygems
require 'rubygems'

## view sql when script/consle
require "active_record"
ActiveRecord::Base.logger = Logger.new(STDOUT)

## http://doc.okkez.net/static/192/library/irb=2fcompletion.html
require 'irb/completion'

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

## see refe in IRB
# http://d.hatena.ne.jp/secondlife/20051114/1131894899
module Kernel
  def r(arg)
    puts `refe #{arg}`
  end
  private :r
end

class Module
  def r(meth = nil)
    if meth
      if instance_methods(false).include? meth.to_s
        puts `refe #{self}##{meth}`
      else
        super
      end
    else
      puts `refe #{self}`
    end
  end
end

## http://tagaholic.me/hirb/doc/
# Hirb doesn't use with awesome_print
# require 'hirb'
# Hirb.enable
# $KCODE = 'e'

## http://irb-history.rubyforge.org/rdoc/
# IRB has history function already?
#require 'irb/history'
#IRB::History.start_client


## setup end -------------------------------------------------------------------------------

## for config check
rescue Exception => e
 p e
end
