require 'benchmark/ips'
require_relative 'resistor_color_duo'

module SymbolHash
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

  COLORS = ResistorColorDuo::BAND.keys
  SYMBOLS = BAND.keys

  def value_from_strings(bands)
    bands.map { |color| BAND[color.to_sym].to_s }.join[0,2].to_i
  end

  def value_from_symbols(bands)
    bands.map { |color| BAND[color].to_s }.join[0,2].to_i
  end
end
ResistorColorDuo.extend SymbolHash

Benchmark.ips do |x|
  x.report('Using Strings as Keys Passing Strings') { ResistorColorDuo.value([SymbolHash::COLORS.sample, SymbolHash::COLORS.sample]) }
  x.report('Using Symbols as Keys Passing Strings') { ResistorColorDuo.value_from_strings([SymbolHash::COLORS.sample, SymbolHash::COLORS.sample]) }
  x.report('Using Symbols as Keys Passing Symbols') { ResistorColorDuo.value_from_symbols([SymbolHash::SYMBOLS.sample, SymbolHash::SYMBOLS.sample]) }
  x.compare!
end