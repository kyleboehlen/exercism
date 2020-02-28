require 'date' # for DateTime

class Gigasecond
  GIGASECOND = 1_000_000_000
  AS_DAYS = Rational(GIGASECOND, 86400)
  private_constant :AS_DAYS

  # Accepts Numeric, DateTime, and Time
  def self.from(seconds)
    case seconds
    when Numeric, Time
      seconds + GIGASECOND
    when DateTime
      seconds + AS_DAYS
    else
      raise ArgumentError.new(
        'Invalid class %s given' % seconds.class
      )
    end
  end
end

if defined?(Minitest)
  describe Gigasecond do
    describe 'Custom Test Based on Name of Class' do
      it 'must accept the simple thing' do
        expected = 1000000012.75
        _(Gigasecond.from(12.75)).must_equal expected
      end

      it 'must result in a Numeric object when a integer is given' do
        actual = Gigasecond.from(12)
        _(actual).must_be_kind_of Numeric
      end

      it 'must result in a Numeric object when a float is given' do
        actual = Gigasecond.from(12.75)
        _(actual).must_be_kind_of Numeric
      end

      it 'must result in a Numeric object when a rational is given' do
        actual = Gigasecond.from(51/4r)
        _(actual).must_be_kind_of Numeric
      end

      it 'must result in a DateTime object when a DateTime is given' do
        expected = DateTime
        actual = Gigasecond.from(DateTime.new(1970, 1, 1, 0, 0, 0))
        _(actual).must_be_kind_of Date
      end

      it 'must result in a Time object when time is given' do
        expected = Time
        actual = Gigasecond.from(Time.now)
        _(actual).must_be_kind_of Time
      end

      it 'must raise error ArgumentError if Date is given' do
        assert_raises ArgumentError do
          _(Gigasecond.from(Date.new(1900, 1, 1)))
        end
      end
    end
  end
end