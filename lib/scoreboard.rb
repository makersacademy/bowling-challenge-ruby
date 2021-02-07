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
    adding_extra_points
    puts "Your total score is #{total}"
  end

  def adding_extra_points
    adding_strike_points
    adding_spare_points
    p @frame_score
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
      bonus_roll
      second_roll
    else
      second_roll
    end
  end

  def first_roll
    puts "What's the score on your first roll?"
    roll_1 = gets.chomp.to_i
    @frame_score[@frames] = [roll_1]
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
      @frame_score[frame] = [10 + (@frame_score[frame+1]).sum ]if rolls[0] == 10 && frame != 10
    end
    p @frame_score
  end


  def adding_spare_points
    @frame_score.each do |frame, rolls|
      if rolls.sum == 10 && frame != 10
        @frame_score[frame] = [10 + @frame_score[frame+1][0]]
      end
    end
    p @frame_score
  end

  def total
    @frame_score.each { |frame, rolls| @score << rolls }
    @score.flatten.sum
  end

  def bonus_roll
    puts "What's the score on your bonus roll?"
    bonus_roll = gets.chomp.to_i
    @frame_score[@frames].push(bonus_roll)
  end

end
