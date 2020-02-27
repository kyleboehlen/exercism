require 'benchmark'

class ResistorColor
           #  0         1       2       3         4         5       6        7        8        9
  COLORS = ["black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"] # Define colors with their code as the index
  COLORS_MAP = Hash[(COLORS).zip(0...10)]

  def self.color_code(color)
    COLORS.index(color) # Index of array method
  end

  def self.map_color_code(color)
    COLORS_MAP[color] # Hash method
  end
end

puts 'Benchmarking index function on array method...'
puts Benchmark.measure {
  1_000_000.times { ResistorColor.color_code(ResistorColor::COLORS.sample) }
}

puts 'Benchmarking hash method...'
puts Benchmark.measure {
  1_000_000.times { ResistorColor.map_color_code(ResistorColor::COLORS.sample) }
}