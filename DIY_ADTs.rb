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
end
