class Frame

  attr_reader :frame_number, :score, :bowl1, :bowl2, :bowl3

  def initialize(frame_number)
    @frame_number = frame_number
    @score = 0
    @bowl1 = nil
    @bowl2 = nil
    @bowl3 = nil

    puts "=== Frame #{frame_number} ==="
  end

  def enter_bowl(bowl_number)
    ordinal = {
      1 => 'first',
      2 => 'second',
      3 => 'third'
    }

    puts "Please enter the number of pins downed on your #{ordinal[bowl_number]} bowl:"
    
    case bowl_number
    when 1 
      @bowl1 = gets.chomp.to_i
      if @bowl1 == 10 && @frame_number != 10
        puts "STRIKE!!!"
      end
    when 2
      @bowl2 = gets.chomp.to_i
      if @bowl1 + @bowl2 == 10 && @frame_number != 10
        puts "SPARE!!!"
      end
    when 3
      @bowl3 = gets.chomp.to_i
      if @bowl3 == 10
        puts "STRIKE!!!"
      end
    end
  end

  def add_score(score)
    @score += score
  end

end