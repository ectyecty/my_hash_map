class Link
  attr_accessor :key, :val, :next

  def initialize(key = nil, val = nil, nxt = nil)
    @key, @val, @next = key, val, nxt
  end

  def to_s
    "#{@key}, #{@val}"
  end
end

class LinkedList
  attr_reader :head

  def initialize
    @head = Link.new
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head
  end

  def last
    last = @head
    while @last.next
      last = last.next
    end
    last
  end

  def empty?
    @head.next.nil?
  end

  def get(key)
    current_element = @head
    while current_element && current_element.key != key
      current_element = current_element.next
    end
    if current_element
      return current_element.val
    else
      return nil
    end
  end

  def include?(key)
    current_element = @head
    while current_element && current_element.key != key
      current_element = current_element.next
    end
    if current_element
      return true
    else
      return false
    end
  end

  def insert(key, val)
    temp = @head
    @head = Link.new(key, val)
    @head.next = temp
  end

  def remove(key)
    old_element = self.next
    previous_element = nil
    current_element = @head

    while current_element.key != key && current_element
      previous_element = current_element
      current_element = current_element.next
    end

    if current_element




  end

  def each
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
