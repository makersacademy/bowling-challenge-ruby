class BowlingCard

  attr_reader :frame_round

  def initialize
    @frame_round = 1
  end

  def frames
    roll
    roll
    @frame_round += 1
    if @frame_round < 10
      score
      frames
    else
      print_score
    end
  end

  def roll

  end

  def print_score

  end

  def score

  end

end