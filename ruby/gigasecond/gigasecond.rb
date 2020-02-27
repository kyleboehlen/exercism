require 'date' # require for DateTime class

class Gigasecond
  GIGASECOND =
  {
    Seconds: (10**9), # define gigasecond in seconds
    Days: (10**9).to_f / 86400 # define gigasecond in days
  }

  def self.from(time) # accepts Time or DateTime and returns a Time object with a gigasecond added
    unless time.instance_of? DateTime # check if time is DateTime instead of Time
      return time + GIGASECOND[:Seconds] # return gigasecond added to time
    end

    (time + GIGASECOND[:Days]).to_time # add days to DateTime obj and return Time obj
  end
end
