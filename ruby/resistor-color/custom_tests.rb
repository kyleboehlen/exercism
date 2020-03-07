class ResistorColorCustomTest < Minitest::Test
  def test_black
    assert_equal 0, ResistorColor.code_from("black")
  end

  def test_white
    assert_equal 9, ResistorColor.code_from("white")
  end

  def test_orange
    assert_equal 3, ResistorColor.code_from("orange")
  end

  def test_colors
    expected = ["black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"]
    assert_equal expected, ResistorColor::COLORS
  end

  def test_invalid_color
    assert_nil ResistorColor.code_from("teal")
  end
end
