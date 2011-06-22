require "rubygems"
require "bundler/setup"
require "pp"
require "benchmark"
require_relative "toucan"

toucan = Toucan.new

bm = Benchmark.measure do
  # 12x increments
  1000.times do
    toucan.add_event(Time.now.to_i, "url", ["com", "amazon", "music"], 1)
  end
end

puts bm.real

# toucan.add_event(Time.now.to_i, "url", ["com", "facebook", "www"], 1)
#
# puts "minute - com"
# pp toucan.minute_counts("com")
# puts
#
# puts "hour - com.amazon"
# pp toucan.hour_counts("com.amazon")
# puts
#
# puts "day - com - 5 points"
# pp toucan.day_counts("com", 5)
# puts
#
# puts "lifetime - com.facebook.www"
# pp toucan.lifetime_counts("com.facebook.www")
# puts
