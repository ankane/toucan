require_relative "toucan"
require "pp"

toucan = Toucan.new

toucan.add_event(Time.now.to_i, "url", ["com", "amazon", "music"], 1)
toucan.add_event(Time.now.to_i, "url", ["com", "facebook", "www"], 1)

puts "minute - com"
pp toucan.minute_counts("com")
puts

puts "hour - com.amazon"
pp toucan.hour_counts("com.amazon")
puts

puts "day - com - 5 points"
pp toucan.day_counts("com", 5)
puts

puts "lifetime - com.facebook.www"
pp toucan.lifetime_counts("com.facebook.www")
puts
