class BowlingGame
    def initialize
      @rolls = []
    end
    
    def roll pins
      @rolls.push pins
    end
    
    def score
        @rolls.reduce(:+)
    end
 

end
