class Frame
    attr_reader :number, :rolls

    def initialize(number)
        @number = number
        @rolls = []
    end

    def add_roll(pins)
        @rolls << pins
    end

    def finished?
        rolls[0] == 10 || rolls.length > 1
    end
end