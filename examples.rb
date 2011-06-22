require_relative "toucan"

add_event(Time.now.to_i, "url", ["com", "amazon", "music"], 1)
add_event(Time.now.to_i, "url", ["com", "facebook", "www"], 1)

puts "minute - com"
pp minute_counts("com")
puts

puts "hour - com.amazon"
pp hour_counts("com.amazon")
puts

puts "day - com - 5 points"
pp day_counts("com", 5)
puts

puts "lifetime - com.facebook.www"
pp lifetime_counts("com.facebook.www")
puts
