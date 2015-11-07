class MaxIntSet

  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    validate!(num)
    @store[num] = true
  end

  def remove(num)
    validate!(num)
    @store[num] = false
  end

  def include?(num)
    validate!(num)
    @store[num]
  end

  private

  def is_valid?(num)
    (0...@store.size).cover?(num)
  end

  def validate!(num)
    raise "Out of bounds" unless is_valid?(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store[num % @store.size] << num
  end

  def remove(num)
    @store[num % @store.size].delete(num)
  end

  def include?(num)
    @store[num % @store.size].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    @store[num % @store.size] << num
    @count += 1
    if @count > num_buckets
      resize!
    end
  end

  def remove(num)
    @store[num % @store.size].delete(num)
    @count -= 1
  end

  def include?(num)
    @store[num % @store.size].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store.flatten
    new_store_size = @store.size * 2
    @store = new_store = Array.new(new_store_size) { Array.new }
    @count = 0
    old_store.each do |element|
      insert(element)
    end
  end
end
