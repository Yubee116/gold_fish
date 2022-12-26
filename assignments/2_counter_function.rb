class Counter
  def initialize(starting_value)
    @current_value = starting_value
  end

  def get_current_value
    @current_value
  end

  def increment_value_by_one
    @current_value += 1
  end

  def self.counter(starting_value = 0, *_args)
    return unless starting_value.is_a?(Numeric)

    array_to_return = []
    obj = Counter.new(starting_value)
    instance_methods = obj.methods - Object.methods
    instance_methods.each do |method_name|
      array_to_return.append(obj.method(method_name))
    end
    array_to_return
  end
end

# yubees_counter = Counter.counter(30)

# puts "Current value of counter:  #{yubees_counter[0].call}"
# puts "Increment current value of counter and print new value:  #{yubees_counter[1].call}"
