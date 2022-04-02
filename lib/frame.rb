class Frame

  attr_reader :strike, :spare, :rolls

  def initialize()
    @rolls = []
    @strike = false
    @spare = false
    #should i create a bonus on the 
    #frame for spares and strikes?
  end

  def add_roll(pins)
    @rolls << pins

    if @rolls[0] == 10
      @strike = true
    elsif @rolls.sum == 10
      @spare = true
    end

  end

  
  def frame_score
    @rolls.sum
  end
  
  
  def complete?
    if @rolls[0] == 10 || @rolls.count == 2
      return true
    end
    false
  end

end