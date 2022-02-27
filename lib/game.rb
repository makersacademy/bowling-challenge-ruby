class Game

    def initialize
      @total = 0
      @spare = false
    end


  def score(game_result)
    game_result.each do |frame, pins|
      if @spare == true
        @total += pins[0]
        @spare = false
      end
      if pins.sum == 10
        @spare = true
      end
      @total += pins.sum
      
    end
    @total
  end

end