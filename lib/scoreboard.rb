class Scoreboard

  attr_reader :score, :frame_score

  def initialize
    @frames = 1
    @frame_score = []
    @score = []
  end

  def run
    frames_to_9
    frame_10
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
    @frame_score << roll_1
    @score << roll_1
  end

  def second_roll
    puts "What's the score on your second roll?"
    roll_2 = gets.chomp.to_i
    @frame_score << roll_2
    @score << roll_2
    @frames += 1
  end

  def strike?
    @frame_score[-1] == 10
  end

  def spare?
    @frame_score[-1] + @frame_score[-2] == 10
  end

  def total
    @score.sum
  end

  # def strike_bonus
  #   frame_score[-3] += (frame_score[-1] + frame_score[-2])
  # end

  def bonus_roll
    puts "What's the score on your bonus roll?"
    bonus_roll = gets.chomp.to_i
    @frame_score << bonus_roll
    @score << bonus_roll
  end
end
