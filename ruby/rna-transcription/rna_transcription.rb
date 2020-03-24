class Complement
  PAIRS = {
    'A' => 'U',
    'C' => 'G',
    'G' => 'C',
    'T' => 'A',
  }

  def self.of_dna(strand)
    strand.chars.map { |c| PAIRS[c] }.join
  end

  def self.of_rna(strand)
    strand.chars.map { |c| PAIRS.key(c) }.join
  end
end

if defined? Minitest
  require_relative 'custom_tests.rb'
end