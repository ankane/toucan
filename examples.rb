require "rubygems"
require "bundler/setup"
require "pp"
require_relative "toucan"

toucan = Toucan.new

toucan.add_event(Time.now, "url", ["com", "amazon", "music"], 1)
toucan.add_event(Time.now, "url", ["com", "facebook", "www"], 1)

puts "minute - com"
pp toucan.minute_counts("url", "com")
puts

puts "hour - com.amazon"
pp toucan.hour_counts("url", "com.amazon")
puts

puts "day - com - 5 points"
pp toucan.day_counts("url", "com", 5)
puts

puts "lifetime - com.facebook.www"
pp toucan.lifetime_counts("url", "com.facebook.www")
puts
