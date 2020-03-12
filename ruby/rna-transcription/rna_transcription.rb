class Complement
  PAIRS = {
    'A' => 'U',
    'C' => 'G',
    'G' => 'C',
    'T' => 'A',
  }

  def self.of_dna(strand)
    compliment = ''
    strand.each_char { |c| compliment << PAIRS[c].to_s }
    compliment
  end

  def self.of_rna(strand)
    compliment = ''
    strand.each_char { |c| compliment << PAIRS.key(c).to_s }
    compliment
  end
end

if defined? Minitest
  require_relative 'custom_tests.rb'
end