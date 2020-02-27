require 'date' # require for DateTime class
require 'minitest/autorun' # require for tests

class Gigasecond
  GIGASECOND = 1_000_000_000 # define gigasecond in Integer as number of seconds

  def self.from(time)
    if [Date, DateTime].any? { |c| time.instance_of? c }  # check if time is Date or DateTime
      time = time.to_time # Convert time to Time
    end

    time + GIGASECOND # Return time with a gigasecond added
  end
end

if defined?(Minitest)
  puts 'Mini test defined, running tests...'

  describe Gigasecond do
    describe 'Custom Test Based on Name of Class' do
      it 'must accept the simple thing' do
        expected = 1000000012.75
        _(Gigasecond.from(12.75)).must_equal expected
      end

      it 'must give a correct date if a Date of 1970, 1, 1 is given' do
        expected = Date.new(2001, 9, 9)
        actual = Gigasecond.from(Date.new(1970, 1, 1)).to_date
        _(actual).must_equal expected
      end
    end
  end
end