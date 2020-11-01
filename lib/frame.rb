class Frame

  attr_reader :frame

  def initialize
    @frame = Hash.new(0)
  end

  def add_score(score)
    @frame['frame_roll'] +=1
    strike_or_spare?(score)
    @frame['score'] += score
  end

  def score
    @frame['score']
  end

  def frame_roll
    @frame['frame_roll']
  end

  def strike?
    @frame['strike']
  end

  def spare?
    @frame['spare']
  end

  def strike_or_spare?(score)
    if score == 10 && frame_roll == 1
      @frame['strike'] = true
    elsif @frame['score'] + score == 10
      @frame['spare'] = true
     end
  end

end
