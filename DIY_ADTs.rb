# Ex 1

class Stack
  def initialize
    # create ivar to store stack here!
    @stack = Array.new
  end

  def add(el)
    # adds an element to the stack
    @stack.push(el)
    el
  end

  def remove
    # removes one element from the stack
    @stack.pop
  end

  def show
    # return a copy of the stack
    @stack.dup
  end
end


# Ex 2

class Queue
  def initialize
    @queue = Array.new
  end

  def enqueue(el)
    @queue.push(el)
    el
  end

  def dequeue
    @queue.shift
  end

  def show
    @queue.dup
  end
end

# Ex 3

class Map
  def initialize
    @map = Array.new
  end

  def assign(key, value)
    @map.push([key, value])
    [key, value]
  end
end

# Why exactly is deep duplication necessary

# class Array
#   def deep_dup
#     self.map {|el| el.is_a?(Array) ? el.deep_dup : el}
#   end
# end
