class ResistorColor
  BAND =
    {
      "black"  => 0,
      "brown"  => 1,
      "red"    => 2,
      "orange" => 3,
      "yellow" => 4,
      "green"  => 5,
      "blue"   => 6,
      "violet" => 7,
      "grey"   => 8,
      "white"  => 9,
    }
  
  COLORS = BAND.keys
  
  def self.color_code(color)
    BAND[color] # Hash method
  end

  class << self
    # code_from reads better than color_code
    alias_method :code_from, :color_code
  end
end

if defined? Minitest
  require_relative 'custom_tests.rb'
end

if $PROGRAM_NAME == __FILE__
  require 'benchmark/ips'

  # Getting color code based on index of array derived from hash
  module ArrayMethod
    def index_of(color)
      ResistorColor::COLORS.index(color) # Index of array method
    end
  end
  ResistorColor.extend ArrayMethod

  Benchmark.ips do |x|
    x.report('Using Hash') { ResistorColor.code_from(ResistorColor::COLORS.sample) }
    x.report('Using Array derived from Hash keys') { ResistorColor.index_of(ResistorColor::COLORS.sample) }
    x.compare!
  end
end
