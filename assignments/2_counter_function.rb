def counter(starting_value = 0, *_args)
  return unless starting_value.is_a?(Numeric)

  counter = starting_value
  [-> { counter }, -> { counter += 1 }]
end

# yubees_counter = counter(30)

# puts "Current value of counter:  #{yubees_counter[0].call}"
# puts "Increment current value of counter and print new value:  #{yubees_counter[1].call}"
