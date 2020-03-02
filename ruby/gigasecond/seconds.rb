class Seconds

  private
  def initialize(number)
    @seconds = number
  end

  attr_reader :seconds

  public

  def +(other)
    self.class.new(seconds + other)
  end
  def to_i
    seconds.to_i
  end
  def to_f
    seconds.to_f
  end
  def to_s
    '%f' %  seconds
  end
  def to_r
    seconds.to_r
  end
end