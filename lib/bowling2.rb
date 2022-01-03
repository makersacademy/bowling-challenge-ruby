class Bowling2

  attr_reader :turn, :frame, :total_score, :score, :strike_frames

  def initialize
    @turn = 1
    @frame = 1
    @total_score = 0
    @score = []
    @strike_frames = []
  end

  def input(pins)
    game_over
    raise 'Invalid input' unless valid_input(pins)
    if @turn == 1 && pins == 10 
      @strike_frames << @frame
    end
    if check_spare && @turn == 1
      @total_score += pins
    end
    if @strike_frames.include?(@frame - 1) && @turn == 2
      @total_score += pins + score[-1]
    end
    @score << pins
    @total_score += pins
    increase_turn
  end

  def increase_turn
    if check_strike(@frame)
      increase_frame
    elsif @turn == 1
      @turn += 1
    else
      increase_frame
      @turn = 1
    end
  end

  def increase_frame
    @frame += 1
  end

  def check_spare
    if @frame == 1
      false
    elsif @score[-1] == 10
      false
    elsif @score[-1] + @score[-2] == 10
      true
    else
      false
    end
  end

  def check_strike(given_frame)
    @strike_frames.include?(given_frame)
  end

  def valid_input(pins)
    return false unless (0..10).include? pins

    if @turn == 1
      true
    elsif (0..10).include?(@score[-1] + pins)
      true
    else
      false
    end
  end

  def game_over
    raise 'Game Over. 10 Frames completed' if @frame == 11
  end

end
