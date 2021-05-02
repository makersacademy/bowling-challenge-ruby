class Player
  
  def self.bowl(score)
    if @roll == 1
      @scorecard << [score]
      @roll = 2
    else
      @scorecard[@frame - 1] << score
      @roll = 1
      @frame += 1
    end
  end
end
