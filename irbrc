require 'pp'
require 'rubygems'
require 'yaml'

# wirble is amazing
# it gives you cross-session history, coloring, and auto-completion
require 'wirble'
require 'hirb'
Wirble.init
Wirble.colorize
# hirb (active record output format in table)
Hirb::View.enable

# IRB Options
IRB.conf[:AUTO_INDENT] = true
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:EVAL_HISTORY] = 200

class Object
  # get all the methods for an object that aren't basic methods from Object
  def local_methods
    (methods - Object.instance_methods).sort
  end
end

# from http://themomorohoax.com/2009/03/27/irb-tip-load-files-faster
def ls
   %x{ls}.split("\n")
end

def cd(dir)
  Dir.chdir(dir.to_s)
  Dir.pwd
end

def pwd
  Dir.pwd
end

def mate(obj)
  IO.popen( 'mate -', 'w') do |io|
    io.puts obj.to_yaml
  end
end

# also from http://themomorohoax.com/2009/03/27/irb-tip-load-files-faster
def rl(file_name = nil)
  if file_name.nil?
    if !@recent.nil?
      rl(@recent) 
    else
      puts "No recent file to reload"
    end
  else
    file_name += '.rb' unless file_name =~ /\.rb/
    @recent = file_name 
    load "#{file_name}"
  end
end

alias p pp
alias q exit
alias quit exit

# From http://toolmantim.com/articles/system_wide_script_console_logging
# script/console will now output its log into the console
script_console_running = ENV.include?('RAILS_ENV') && IRB.conf[:LOAD_MODULES] && IRB.conf[:LOAD_MODULES].include?('console_with_helpers')
rails_running = ENV.include?('RAILS_ENV') && !(IRB.conf[:LOAD_MODULES] && IRB.conf[:LOAD_MODULES].include?('console_with_helpers'))
irb_standalone_running = !script_console_running && !rails_running

if script_console_running
  require 'logger'
  Object.const_set(:RAILS_DEFAULT_LOGGER, Logger.new(STDOUT))
end

# from http://www.tech-angels.fr/post/963080350/improve-irb-and-fix-it-on-mac-os-x
# mod http://gist.github.com/547170
#rails2
if ENV.include?('RAILS_ENV') && !Object.const_defined?('RAILS_DEFAULT_LOGGER')
  # Log to STDOUT if in Rails
  require 'logger'
  RAILS_DEFAULT_LOGGER = Logger.new(STDOUT)
  #IRB.conf[:USE_READLINE] = true

  # Display the RAILS ENV in the prompt
  # ie : [Development]>>
  IRB.conf[:PROMPT][:CUSTOM] = {
   :PROMPT_N => "[#{ENV["RAILS_ENV"].capitalize}]>> ",
   :PROMPT_I => "[#{ENV["RAILS_ENV"].capitalize}]>> ",
   :PROMPT_S => nil,
   :PROMPT_C => "?> ",
   :RETURN => "=> %s\n"
   }
  # Set default prompt
  IRB.conf[:PROMPT_MODE] = :CUSTOM
#rails3
elsif defined?(Rails)
  require 'logger'
  Rails.logger=Logger.new(STDOUT)
  #IRB.conf[:USE_READLINE] = true

  # Display the RAILS ENV in the prompt
  # ie : [Development]>>
  IRB.conf[:PROMPT][:CUSTOM] = {
   :PROMPT_N => "[#{Rails.env.capitalize}]>> ",
   :PROMPT_I => "[#{Rails.env.capitalize}]>> ",
   :PROMPT_S => nil,
   :PROMPT_C => "?> ",
   :RETURN => "=> %s\n"
   }
  # Set default prompt
  IRB.conf[:PROMPT_MODE] = :CUSTOM
end
