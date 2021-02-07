class Scoreboard

  attr_reader :score, :frame_score, :frames

  def initialize
    @frames = 1
    @frame_score = {}
    @score = []
  end

  def run
    frames_to_9
    frame_10
    adding_strike_points
    puts "Your total score is #{total}"
  end

  def frames_to_9
    while @frames < 10
      first_roll
      if strike?
        @frames += 1
      else
        second_roll
      end
    end
  end

  def frame_10
    first_roll
    if strike?
      second_roll
      bonus_roll
    else
      second_roll
    end
  end

  def first_roll
    puts "What's the score on your first roll?"
    roll_1 = gets.chomp.to_i
    @frame_score[@frames] = [roll_1]
    p @frame_score
  end


  def second_roll
    puts "What's the score on your second roll?"
    roll_2 = gets.chomp.to_i
    @frame_score[@frames].push(roll_2)
    @frames += 1
    p @frame_score
  end

  def strike?
    @frame_score[@frames][0] == 10
  end

  def adding_strike_points
    @frame_score.each do |frame, rolls|
    if rolls[0] == 10
      @frame_score[frame] = 10 + (@frame_score[frame+1]).sum
    end
  end
  p @frame_score
end


  def spare?(frame)
    @frame_score[frame].sum == 10
  end

  def total
    @score.sum
  end

  def strike_bonus
    @frame_score[frames - 3] += (@frame_score[frames - 2][0] + @frame_score[frames -2][1])
  end

  def bonus_roll
    puts "What's the score on your bonus roll?"
    bonus_roll = gets.chomp.to_i
    @frame_score << bonus_roll
    @score << bonus_roll
  end

  def update_previous_score
    if strike?
      strike_bonus
    elsif spare?(@frames - 1)
      spare_bonus
    end
  end

  def spare_bonus
    @frame_score[-2] + @frame_score[-3] += @frame_score[-1]
  end
end
