module DivisibleIntegers
  refine Integer do
    def evenly_divisible_by?(number)
      modulo(number).zero?
    end

    def not_evenly_divisible_by?(number)
      !evenly_divisible_by? number
    end
  end
end

class Year
  using DivisibleIntegers

  def initialize(year)
    @year = year.to_i
  end

  def self.leap?(year)
    new(year).leap?
  end

  def leap?
    @year.evenly_divisible_by?(400) || @year.evenly_divisible_by?(4) && @year.not_evenly_divisible_by?(100)
  end
end