

class Game

  def initialize
    @frame = Frame.new
    @game = Array.new(0)
  end

  def add_score(score)
    reset_frame?
    @frame.add_score(score)
  end

  def score
    if @game.empty?
      @frame.score
    else
      @frame.score + @game.map {|frame| frame['score']}.reduce(:+)
    end
  end

  def reset_frame?
    if @frame.frame_roll == 2
      reset
    elsif @frame.strike? == true
      reset
    end
  end

  def reset
    @game << @frame
    @frame = Frame.new
  end

  def frame_number
    @game.length + 1
  end

  def roll_number
    if @game.empty?
      @frame.frame_roll
    else
      @frame.frame_roll + @game.map {|frame| frame.frame_roll}.reduce(:+)
    end
  end

end
