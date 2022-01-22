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
      20.times do
        res += @rolls[roll]
        roll += 1   
      end
      res

    end

end
