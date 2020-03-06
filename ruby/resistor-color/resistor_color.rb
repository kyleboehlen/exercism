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
end

if $PROGRAM_NAME == __FILE__
  puts 'Benchmarking index function on array method...'
  puts Benchmark.measure {
    1_000_000.times { ResistorColor.color_code(ResistorColor::COLORS.sample) }
  }

  puts 'Benchmarking hash method...'
  puts Benchmark.measure {
    1_000_000.times { ResistorColor.map_color_code(ResistorColor::COLORS.sample) }
  }
end