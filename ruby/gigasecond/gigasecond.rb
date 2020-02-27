require 'date' # require for DateTime class

class Gigasecond
  GIGASECOND = 1_000_000_000 # define gigasecond in Integer as number of seconds
  GIGASECOND_AS_DAYS = Rational(GIGASECOND, 86400) # define gigasecond in Rational as number of days

  def self.from(time) # Accepts Numeric, DateTime, and Time
    time + (([Date, DateTime].any? { |c| time.instance_of? c }) ? GIGASECOND_AS_DAYS : GIGASECOND) # Will return whatever type was passed with gigasecond added
  end
end

if defined?(Minitest)
  describe Gigasecond do
    describe 'Custom Test Based on Name of Class' do
      it 'must accept the simple thing' do
        expected = 1000000012.75
        _(Gigasecond.from(12.75)).must_equal expected
      end

      it 'must result in a Integer object when a integer is given' do
        expected = Integer
        actual = Gigasecond.from(12)
        _(actual).must_be_kind_of Integer
      end

      it 'must result in a Float object when a float is given' do
        expected = Float
        actual = Gigasecond.from(12.75)
        _(actual).must_be_kind_of Numeric
      end

      it 'must result in a DateTime object when a DateTime is given' do
        expected = DateTime
        actual = Gigasecond.from(DateTime.new(1970, 1, 1, 0, 0, 0))
        _(actual).must_be_kind_of Date
      end

      it 'must result in a Date object when a date is given' do
        expected = Date
        actual = Gigasecond.from(Date.new(1970, 1, 1))
        _(actual).must_be_kind_of Date
      end

      it 'must result in a Time object when time is given' do
        expected = Time
        actual = Gigasecond.from(Time.now)
        _(actual).must_be_kind_of Time
      end
    end
  end
end