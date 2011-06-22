require "rubygems"
require "bundler/setup"
require "redis"

$redis = Redis.new

def add_event(timestamp, category, key, value, properties = {}, properties_with_counts = {})
  pairs = {}
  begin
    pairs[key.join(".")] = value
  end while key.pop and !key.empty?

  # no time buckets for now

  pairs.each do |key, val|
    $redis.incrby("lifetime:#{key}", val)
    hour = round_time(timestamp, 3600)
    $redis.incrby("hour.#{hour}:#{key}", val)
    minute = round_time(timestamp, 60)
    $redis.incrby("minute.#{minute}:#{key}", val)
  end
end

def round_time(timestamp, seconds = 60)
  (timestamp.to_f / seconds).floor * seconds
end

def print_counts(key)
  last = round_time(Time.now, 60)
  first = last - 300
  steps = *(first..last).step(60)

  keys = steps.map{|step| "minute.#{step}:#{key}"}

  # get keys and replace nils with zero
  values = $redis.mget(*keys).map{|val| (val || 0).to_i }

  puts "#{key}: #{values.inspect}"
end
