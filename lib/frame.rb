class Frame
  attr_reader :pinfall, :scorecard

  def initialize
    @pinfall = []
    @scorecard = []
  end

  def first_roll(pinfall)
    @pinfall << pinfall
    if @pinfall.sum == 10 
      save_to_scorecard
      return 'STRIKE! End of frame' 
    else
      return 'Player to roll again'
    end
  end

  def second_roll(pinfall)
    @pinfall << pinfall
    save_to_scorecard 
    @scorecard.last == 10 ? (return "SPARE!") : (return "You knocked over #{@scorecard.last} pins")
  end

  private
  
  def save_to_scorecard
    @scorecard << @pinfall.sum 
    @pinfall.clear
  end

end
