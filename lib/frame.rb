class Frame
    attr_reader :rolls
    PINS = 10

    def initialize
    #   @number = number
      @rolls = []
      @pins = PINS
      # @remaining_pins = PINS
    end

    def score
      @rolls.sum
    end

    def roll(pins) # throw is Integer(1...10)
      @rolls << pins
      # @remaining_pins -= pins
    end

# this will be used to determined when to stop calling #add
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

