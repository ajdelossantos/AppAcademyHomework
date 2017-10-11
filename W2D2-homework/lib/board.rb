class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) { Array.new }
    place_stones
    @name1 = name1
    @name2 = name2
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, idx|
      4.times { cup << :stone unless idx == 6 || idx == 13 }
    end
  end

  def valid_move?(start_pos)
    #start pos is index -- adjust for user input
    raise 'Invalid starting cup' unless (1..12).to_a.include?(start_pos)
  end

  def make_move(start_pos, current_player_name)
    # start_pos
    hand = []

    @cups[start_pos].length.times do
      hand << @cups[start_pos].pop
    end

    # start_idx = (start_pos + 1) % 14

    current_cup = start_pos

    until hand.empty?
      current_cup += 1
      current_cup = current_cup % 14

      if current_cup == 6
        @cups[6] << hand.pop if current_player_name == @name1
      elsif current_cup == 13
        @cups[13] << hand.pop if current_player_name == @name2
      else
        @cups[current_cup] << hand.pop
      end
    end

    render
    next_turn(current_cup)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns

    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].length == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if @cups[0..5].all?(&:empty?) || @cups[7..12].all?(&:empty?)
    false
  end

  def winner
    case @cups[6].length <=> @cups[13].length
    when -1
      @name2
    when 0
      :draw
    when 1
      @name1
    end
  end

end
