$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'rubygems'
require 'test/unit'
require 'ruby-hl7'
#require 'ruby-debug'

module TestHelper
  DATA_DIR = File.join(File.dirname(__FILE__), '..', 'test_data')

  def self.load_hl7(name,kind=:array)
    if(kind==:array)
      File.open(File.join(DATA_DIR, "#{name.to_s}.hl7")).readlines
    elsif(kind==:string)
      File.open(File.join(DATA_DIR, "#{name.to_s}.hl7")) { |f| f.read }
    else
      File.open(File.join(DATA_DIR, "#{name.to_s}.hl7"))
    end
  end
end
