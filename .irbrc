## README
# This .irbrc for ruby 1.8.6 

## for config check
begin

## setup start -------------------------------------------------------------------------------


## IRB Manual
# http://www.ruby-lang.org/ja/man/html/irb.html
#
# other reference:
#  -http://d.hatena.ne.jp/keyesberry/20101116/p1  :lang-ja
#  -http://www.ruby-doc.org/docs/ProgrammingRuby/html/irb.html :lang-en

## Other irb Tips
# http://tagaholic.me/2009/05/11/demystifying-irb-commands.html :lang-en

## prompt mode
IRB.conf[:PROMPT_MODE] = :SIMPLE

#IRB.conf[:PROMPT][:MY_PROMPT] = {
#  :PROMPT_I => "%N(%m)>> ",     # normal prompt
#  :PROMPT_N => "|  ",           # prompt for continuing indent
#  :PROMPT_C => ".> ",           # prompt for continuing statement
#  :PROMPT_S => "%l> ",          # prompt for continuing strings
#  :RETURN   => "=> %s \n"       # format to return value
#}
#IRB.conf[:PROMPT_MODE] = :MY_PROMPT

## rubygems
require 'rubygems'

## pp
require 'pp'

## Editor
# http://ruby.about.com/od/gems/a/sketches.htm
require 'sketches'
Sketches.config :editor => 'vim', :background => false

## view sql when script/consle
require "active_record"
ActiveRecord::Base.logger = Logger.new(STDOUT)

## http://doc.okkez.net/static/192/library/irb=2fcompletion.html
require 'irb/completion'

## alias for exit
def x
  exit
end

## alias for Time.now
def now
  puts Time.now.strftime("%Y/%m/%d(%a) %H:%M:%S")
end

## alias for nkf
require 'nkf'

def utf8out(str)
  NKF.nkf('-w', str)
end

## Return only the methods not present on basic objects
# http://stackoverflow.com/questions/123494/whats-your-favourite-irb-trick
class Object
  def interesting_methods
    (self.methods - Object.new.methods).sort
  end
end

## Quick benchmarking
# Based on rue's irbrc => http://pastie.org/179534
# http://stackoverflow.com/questions/123494/whats-your-favourite-irb-trick
def quick(repetitions=100, &block)
  require 'benchmark'

  Benchmark.bmbm do |b|
    b.report {repetitions.times &block} 
  end
  nil
end

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

## can see refe in IRB
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

## What methods
# https://github.com/BMorearty/what_methods
require 'what_methods'

## History
IRB.conf[:EVAL_HISTORY] = 1000
IRB.conf[:SAVE_HISTORY] = 100

HISTFILE = "~/.irb_history"
MAXHISTSIZE = 100

begin
  if defined? Readline::HISTORY
    histfile = File::expand_path( HISTFILE )
    if File::exists?( histfile )
      lines = IO::readlines( histfile ).collect {|line| line.chomp}
      puts "Read %d saved history commands from %s." %
        [ lines.nitems, histfile ] if $DEBUG || $VERBOSE
      Readline::HISTORY.push( *lines )
    else
      puts "History file '%s' was empty or non-existant." %
        histfile if $DEBUG || $VERBOSE
    end

    Kernel::at_exit {
      lines = Readline::HISTORY.to_a.reverse.uniq.reverse
      lines = lines[ -MAXHISTSIZE, MAXHISTSIZE ] if lines.nitems > MAXHISTSIZE
      $stderr.puts "Saving %d history lines to %s." %

      [ lines.length, histfile ] if $VERBOSE || $DEBUG
      File::open( histfile, File::WRONLY|File::CREAT|File::TRUNC ) {|ofh|
        lines.each {|line| ofh.puts line }
      }
    }
  end
end

## http://tagaholic.me/hirb/doc/
# Hirb doesn't use with awesome_print
# require 'hirb'
# Hirb.enable
# $KCODE = 'e'


## setup end -------------------------------------------------------------------------------

## for config check
rescue Exception => e
 p e
end
