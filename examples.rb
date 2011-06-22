require_relative "toucan"

add_event(Time.now.to_i, "url", ["com", "amazon", "music"], 1)
add_event(Time.now.to_i, "url", ["com", "facebook", "www"], 1)

print_counts("com")
print_counts("com.amazon")
