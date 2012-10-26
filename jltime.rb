class JLTime  
  
  def self.add_minutes_to_time(time, minutes)
    parse(time)
    increment_minutes(minutes)
    return output
  end
  
  private
    
  def self.parse(time)
    raise ArgumentError unless time =~ /^(\d?\d):(\d\d) (AM|PM)/
    hour_input, minute_input, meridian_input = $1, $2, $3
    raise ArgumentError if hour_input.to_i > 12
    raise ArgumentError if minute_input.to_i > 59
    @hour = hour_input.to_i
    @hour += 12 if meridian_input == "PM"
    @hour -= 12 if @hour == 12 && meridian_input == "AM"
    @minute = minute_input.to_i
  end
  
  def self.increment_minutes(incrementing_minutes)
    raise ArgumentError unless @hour && @minute
    minutes_past_midnight = @hour*60 + @minute + incrementing_minutes
    @hour = minutes_past_midnight.divmod(60)[0].divmod(24)[1]
    @minute = minutes_past_midnight.divmod(60)[1]
  end
  
  def self.output
    raise ArgumentError unless @hour && @minute
    meridian = "PM" if (12..23) === @hour
    meridian ||= "AM"
    display_hour = meridian == "PM" ? @hour - 12 : @hour
    display_hour = 12 if display_hour == 0
    return "#{display_hour}:#{@minute} #{meridian}"
  end
end

# Without using any built in date or time functions, write a function or method that accepts two mandatory arguments. The first argument is a string of the format "[H]H:MM {AM|PM}" and the second argument is an integer. Assume the integer is the number of minutes to add to the string. The return value of the function should be a string of the same format as the first argument. For example Add Minutes("9:13 AM", 10) would return "9:23 AM". The exercise isn't meant to be too hard. I just want to see how you code. Feel free to do it procedurally or in an object oriented way, whichever you prefer. Use Ruby. Write production quality code.
