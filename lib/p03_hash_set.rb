require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    @count += 1
    @store[key.hash % @store.length] << key
    if @count > num_buckets
      resize!
    end
  end

  def include?(key)
    # @store[key.hash % @store.length].include?(key)
    @store[key.hash % @store.length].each do |items|
      return true if key == items
    end
    false
  end

  def remove(key)
    @store[key.hash % @store.length].delete(key)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num]
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_buckets = @store
    @count = 0
    @store = Array.new(old_buckets.length*2) { Array.new }

    old_buckets.each do |bucket|
      bucket.each do |key|
        insert(key)
      end
    end
  end
end
