class Integer
  def evenly_divisible_by?(n)
    self % n == 0
  end
end

class Year
  def initialize(year)
    @year = year
  end

  def self.leap?(year)
    new(year).leap?
  end

  def leap?
    return @year.evenly_divisible_by?(4) && !@year.evenly_divisible_by?(100) unless @year.evenly_divisible_by?(400)
    true
  end
end