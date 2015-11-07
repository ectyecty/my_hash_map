class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    # (0...self.size).to_a.inject(0){|acc, index| acc ^= (self[index] * index)}
    # self.each_with_index.to_a. do |element, index|
    #   inject(0) do |acc, el, idx|
    #   acc ^ (el * idx)
    # end
    string = self.to_s
    return my_hash(string)
  end
end

class String
  def hash
    string = self.to_s
    string = self.encode("iso-8859-1").force_encoding("utf-8")
    return my_hash(self.split(//).to_s)
    # self.map(&:ord).hash
  end
end

class Hash
  def hash
    # self.to_a.sort
    string = self.to_a.sort.to_s
    return my_hash(string)
  end
end

def my_hash(string1)
  string1_codes = string1.split(//).map{|x| x.ord }
  hash_result = 0
  string1_codes.each_with_index do |element, index|
    hash_result = hash_result ^ (element * index)
  end
  hash_result
end

# a = (1..100).to_a
# results = Hash.new(0)
# 100.times do |t|
#   array = a.shuffle
#   string = array.to_s
#   this_result = my_hash(string)
#   results[this_result] += 1
# end
#
# results.each do |k, v|
#   puts "#{k} #{v}"
# end
