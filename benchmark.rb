require "rubygems"
require "bundler/setup"
require "benchmark"
require_relative "toucan"

toucan = Toucan.new

bm = Benchmark.measure do
  # 12x incr (= 12000 incr/sec)
  # can get 30000 incr/sec with node
  1000.times do
    toucan.add_event(Time.now.to_i, "url", ["com", "amazon", "music"], 1)
  end
end

puts bm.real
