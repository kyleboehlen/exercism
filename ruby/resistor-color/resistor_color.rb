require 'benchmark'

class ResistorColor
           #  0         1       2       3         4         5       6        7        8        9
  COLORS = ["black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"] # Define colors with their code as the index
  BAND =
    {
      "black" => 0,
      "brown" => 1,
      "red" => 2,
      "orange" => 3,
      "yellow" => 4,
      "green" => 5,
      "blue" => 6,
      "violet" => 7,
      "grey" => 8,
      "white" => 9,
    }

  def self.index_of(color)
    COLORS.index(color) # Index of array method
  end

  # This is the better method
  def self.code_from(color)
    BAND[color] # Hash method
  end

  class << self
    alias_method :color_code, :code_from
  end
end

if defined? Minitest
  require_relative 'custom_tests.rb'
end

if $PROGRAM_NAME == __FILE__
  require 'benchmark/ips'

  Benchmark.ips do |x|
    x.report('Using Hash') { ResistorColor.code_from(ResistorColor::COLORS.sample) }
    x.report('Using Array derived from Hash keys') { ResistorColor.index_of(ResistorColor::COLORS.sample) }
    x.compare!
  end
end
