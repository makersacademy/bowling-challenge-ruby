class FinalFrame
  attr_reader :strike, :spare, :rolls

  def initialize()
    @rolls = []
    @strike = false
    @spare = false
    @bonus = []
  end

  def add_roll(pins)
    
    if @rolls.count < 2 && !@strike
      @rolls << pins
      if @rolls[0] == 10
        @strike = true
      elsif @rolls.sum == 10
        @spare = true
      end
    else
      add_bonus(pins)
    end

  end

  def add_bonus(pins)
    #if spare and we haven't added a bonus yet
    if @spare && @bonus.empty?
      @bonus << pins
    end
    #if strike
    if @strike && @bonus.count < 2
      @bonus << pins
    end

  end
  
  def frame_score
    if score_complete?
    total_score = @rolls + @bonus
    total_score.sum
    else
      0
    end
  end
  
  
  def complete?
    if @rolls[0] == 10 || @rolls.count == 2
      return true
    end
    false
  end

  def score_complete?
    if !@spare && !@strike && complete?
      true
    elsif @spare && !@bonus.empty?
      true
    elsif @strike && @bonus.count == 2
      true
    else
      false
    end
  end
end