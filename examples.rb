require_relative "toucan"

add_event(Time.now.to_i, "url", ["com", "amazon", "music"], 1)
add_event(Time.now.to_i, "url", ["com", "facebook", "www"], 1)

minute_counts("com")
hour_counts("com")
day_counts("com", 5) # 5 points
lifetime_counts("com")
