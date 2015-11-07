string1 = "hello!"

string1_codes = string1.split(//).map{|x| x.ord}
hash_result = 0
string1_codes.each_with_index do |element, index|
  hash_result = hash_result ^ (element * index)
end

p hash_result

string1 = "eh!oll"

string1_codes = string1.split(//).map{|x| x.ord}
hash_result = 0
string1_codes.each_with_index do |element, index|
  hash_result = hash_result ^ (element * index)
end

p hash_result

def encode(string1)
  string1_codes = string1.split(//).map{ |x| x.ord }
  hash_result = 0
  string1_codes.each_with_index do |element, index|
    hash_result = hash_result || (element * index)
  end
  hash_result
end

a = (1..100).to_a
results = Hash.new(0)
100.times do |t|
  array = a.shuffle
  string = array.to_s
  this_result = encode(string)
  results[this_result] += 1
end

results.each do |k, v|
  puts "#{k} #{v}"
end
