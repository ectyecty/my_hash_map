array = Array.new(100) { rand(101) }

new_array = array + array

new_array.shuffle!

missing_element = new_array.shift

guess = new_array.inject(0){|a, e| a ^ e}

puts missing_element.to_s
puts guess.to_s
