class Complement
  PAIRS = {
    'A' => 'U',
    'C' => 'G',
    'G' => 'C',
    'T' => 'A',
  }

  def self.of_dna(strand)
    strand.chars.map { |c| PAIRS[c].to_s }.join
  end

  def self.of_rna(strand)
    strand.chars.map { |c| PAIRS.key(c).to_s }.join
  end
end

if defined? Minitest
  require_relative 'custom_tests.rb'
end