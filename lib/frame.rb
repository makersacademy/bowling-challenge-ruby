class Frame

    attr_reader
    PINS = 10

    def initialize
      @rolls = []
      @pins = PINS
    end

    def score
      @rolls.sum
    end

    def roll(pins) 
      @rolls << pins
    end

    def spare_score
      @rolls.first
    end

    def completed?
      @rolls.length == 2 || @rolls.sum == 10
    end

    def strike?
      @rolls.first == PINS
    end

    def spare?
      !strike? && @rolls.sum == 10
    end
end

