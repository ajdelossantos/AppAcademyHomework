# Ex 1

class Stack
   def initialize
     # create ivar to store stack here!
     @stack = Array.new
   end

   def add(el)
     # adds an element to the stack
     @stack << el
   end

   def remove
     # removes one element from the stack
     @stack.take(@stack.length - 1)
   end

   def show
     # return a copy of the stack
     @stack
   end
 end

#Ex 2

class Queue
  def initialize
    @queue = Array.new
  end

  def enqueue(el)
    @queue.push(el)
  end

  def dequeue
    @queue.drop(1)
  end

  def show
    @queue
  end
end
