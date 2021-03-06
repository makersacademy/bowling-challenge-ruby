class Frame
    attr_reader :pins, :remaining_pins, :rolls
    PINS = 10

    def initialize
        @rolls = []
        # @score = 0
        @pins = PINS
        @remaining_pins = PINS
    end

    def score
        @rolls.sum
    end

    def add(throw) # throw is Integer(1...10)
        @rolls << throw
        @remaining_pins -= throw
    end

# this will be used to determined when to stop calling #add
    def completed?
        @rolls.length == 2 || @remaining_pins == 0
    end

    def strike?
        @rolls.first == PINS
    end

    def spare?
        !strike? && @remaining_pins == 0
    end
end

