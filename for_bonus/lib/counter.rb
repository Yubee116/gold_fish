def counter(starting_value = 0, *_args)
  return unless starting_value.is_a?(Numeric)

  counter = starting_value
  [-> { counter }, -> { counter += 1 }]
end
