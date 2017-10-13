# LRU Cache

class LRUCache
  def initialize(size)
    @cache = []
    @size = size
  end

  def count
    # returns number of elements currently in cache
    @cache.count
  end

  def add(el)
    # adds element to cache according to LRU principle

    # TODO Notice logic implementation of the cache
    # @cache.pop if @cache.count == @size
    # @cache.unshift(el)
    if @cache.include?(el)
      # TODO Remember that the same element gets brought to head
      @cache.delete(el)
      @cache << el
    elsif count >= @size
      @cache.shift
      @cache << el
    else
      @cache << el
    end

    @cache.last
  end

  def show
    # shows the items in the cache, with the LRU item first
    @cache.dup
  end

  private
  # helper methods go here!

end

# TODO implement a working Node and doubly-linked Link class
#
# class Link
# attr_accessor :value, :next_el, :prev_el
#
#   def initialize(value, next_el, prev_el)
#     @value = value
#     @next_el = next_el
#     @prev_el = prev_el
#   end
# end
