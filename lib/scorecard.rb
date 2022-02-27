class Scorecard

    def initialize
      @rolls = []
      @score = 0
    end

    def roll(pins)
      @rolls << pins
    end

    def score
      @rolls.reduce(:+)
    end

    def strike?(frame)
      frame.any? { |n| n == 10 }
    end

    def spare?(frame)
      frame.sum == 10
    end
  

end
