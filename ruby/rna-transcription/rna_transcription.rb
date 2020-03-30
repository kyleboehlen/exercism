class Complement
  PAIRS = {
    'A' => 'U',
    'C' => 'G',
    'G' => 'C',
    'T' => 'A',
  }

  def self.of_dna(strand)
    strand.gsub(Regexp.union(PAIRS.keys), PAIRS)
  end

  def self.of_rna(strand)
    strand.gsub(Regexp.union(PAIRS.values), PAIRS.invert)
  end
end

if defined? Minitest
  require_relative 'custom_tests.rb'
end