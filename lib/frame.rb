class Frame
    attr_reader :number, :rolls

    def initialize(number)
        @number = number
        @rolls = []
    end

    def add_roll(pins)
        @rolls << pins
    end

    def score
        @rolls.sum
    end

    def finished?
        rolls[0] == 10 || rolls.length > 1
    end

    def strike?
        rolls[0] == 10
    end

    def spare?
        rolls[0] + rolls[1] == 10
    end

    def last?
        number == 10
    end
end