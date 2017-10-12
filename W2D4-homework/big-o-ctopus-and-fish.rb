# -----------------------------------------------

def fish_bubble_sort(fish_array, &prc)
  prc ||= Proc.new { |x, y| x <=> y }

  sorted = false
  until sorted
    sorted = true

    fish_array.each_index do |i|
      j = i + 1
      break if i == fish_array.length - 1
      case prc.call(fish_array[i].length, fish_array[j].length)
      when 1
        sorted = false
        fish_array[i], fish_array[j] = fish_array[j], fish_array[i]
      else
        next
      end
    end
  end

  fish_array
end

def fish_merge_sort(array, &prc)
  prc ||= Proc.new { |x, y| x <=> y }
  return array if array.length < 2

  middle = array.length / 2
  left = array.take(middle)
  right = array.drop(middle)

  sorted_left = fish_merge_sort(left, &prc)
  sorted_right = fish_merge_sort(right, &prc)

  fish_merge(sorted_left, sorted_right, &prc)
end

def fish_merge(left, right, &prc)
  merged = []

  until left.empty? || right.empty?
    case prc.call(left.first.length, right.first.length)
    when -1
      merged << left.shift
    when 0
      merged << left.shift
    when 1
      merged << right.shift
    end
  end

  merged + left + right
end

def clever_fish(fish_array)
  biggest_fish = ""

  fish_array.each do |fish|
    biggest_fish = fish if fish.length > biggest_fish.length
  end

  biggest_fish
end

# ----------------------------------

fishes_array = [
  'fish',
  'fiiish',
  'fiiiiish',
  'fiiiish',
  'fffish',
  'ffiiiiisshh',
  'fsh',
  'fiiiissshhhhhh'
]

puts "fish_bubble_sort returns #{fish_bubble_sort(fishes_array)[-1]}"
puts "fish_merge_sort returns #{fish_merge_sort(fishes_array)[-1]}"
puts "clever_fish returns #{clever_fish(fishes_array)}"

# ----------------------------------
def slow_dance(direction, array)
  array.each_with_index { |el, i| return i if direction == el }
end

def index_value_hash_factory(array)
  hash = Hash.new

  array.each_with_index do |el, i|
    hash[el] = i
  end

  hash
end

def fast_dance(direction, hash)
  hash[direction]
end

tiles_array = [
  "up",
  "right-up",
  "right",
  "right-down",
  "down",
  "left-down",
  "left",
  "left-up",
]

tiles_hash = index_value_hash_factory(tiles_array)

puts "Slow dance 'up' returns #{slow_dance("up", tiles_array)}."
# => 0
puts "Slow dance 'right-down' returns #{slow_dance("right-down", tiles_array)}."
# => 3
puts "Slow dance 'up' returns #{fast_dance("up", tiles_hash)}."
# => 0
puts "Fast dance 'right-down' returns #{fast_dance("right-down", tiles_hash)}."
# => 3
