class ResistorColorDuo
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
  
  def self.value(bands)
    # bands.select { |color| BAND.key?(color) }.take... could be used if you needed to validate input before mapping the array
    bands.take(2).map { |color| BAND[color] }.join.to_i
  end
end