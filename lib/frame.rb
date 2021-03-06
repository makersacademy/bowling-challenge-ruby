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
end 