class DnaTranscriptionTest < Minitest::Test
  def test_dna_complement_of_guanine_is_cytosine
    assert_equal 'C', Complement.of_rna('G')
  end

  def test_dna_complement_of_cytosine_is_guanine
    assert_equal 'G', Complement.of_rna('C')
  end

  def test_dna_complement_of_adenine_is_thymine
    assert_equal 'T', Complement.of_rna('A')
  end

  def test_dna_complement_of_uracil_is_adenine
    assert_equal 'A', Complement.of_rna('U')
  end

  def test_dna_complement
    assert_equal 'ACGTGGTCTTAA', Complement.of_rna('UGCACCAGAAUU')
  end
end