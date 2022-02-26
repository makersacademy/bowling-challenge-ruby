class BowlingGame
    def initialize
      @rolls = []
    end
    
    def roll pins
      @rolls.push pins
    end

    def score
      res = 0
      roll = 0
      10.times do
        if @rolls[roll] + @rolls[roll + 1] == 10
          res += @rolls[roll] + @rolls[roll + 1] + @rolls[roll + 2]
        else
          res += @rolls[roll] + @rolls[roll + 1]
        end
      roll += 2 
      end
    res
    end 
end
