require 'benchmark/ips'
require_relative 'resistor_color_duo'

class BenchmarkResistorColorDuo
  BAND =
    {
      black:  0,
      brown:  1,
      red:    2,
      orange: 3,
      yellow: 4,
      green:  5,
      blue:   6,
      violet: 7,
      grey:   8,
      white:  9,
    }

  def self.value(bands)
    bands.take(2)
      .each { |color| validate(color) }
      .map { |color| BAND[color] }
      .join.to_i
  end

  def self.validate(color)
    raise ArgumentError.new('Invalid band color "%s"' % color) unless BAND.key?(color)
  end
  private_class_method :validate
end

Benchmark.ips do |x|
  x.report('Using Strings as Keys') { ResistorColorDuo.value([ResistorColorDuo::BAND.keys.sample, ResistorColorDuo::BAND.keys.sample]) }
  x.report('Using Symbols as Keys') { BenchmarkResistorColorDuo.value([BenchmarkResistorColorDuo::BAND.keys.sample, BenchmarkResistorColorDuo::BAND.keys.sample]) }
  x.compare!
end