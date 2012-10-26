amazing-time-machine
====================

Without using any built in date or time functions, write a function or method that accepts two mandatory arguments. The first argument is a string of the format "[H]H:MM {AM|PM}" and the second argument is an integer. Assume the integer is the number of minutes to add to the string. The return value of the function should be a string of the same format as the first argument. For example Add Minutes("9:13 AM", 10) would return "9:23 AM". The exercise isn't meant to be too hard. I just want to see how you code. Feel free to do it procedurally or in an object oriented way, whichever you prefer. Use Ruby. Write production quality code.

Usage
=====
  >> require 'jltime'
  => true
  >> JLTime.add_minutes_to_time("12:15 AM", 0)
  => "12:15 AM"
  >> JLTime.add_minutes_to_time("9:13 AM", 10)
  => "9:23 AM"
  >> JLTime.add_minutes_to_time("9:13 AM", 60)
  => "10:13 AM"
  >> JLTime.add_minutes_to_time("11:34 PM", 50)
  => "12:24 AM"
  >> JLTime.add_minutes_to_time("6:37 PM", 100000)
  => "5:17 AM"
  >> JLTime.add_minutes_to_time("13:23 AM", 10)
  ArgumentError: ArgumentError
  >> JLTime.add_minutes_to_time("11:99 AM", 10)
  ArgumentError: ArgumentError
  
