class Bowling

    attr_reader :pins,:rolls, :score, :frame_count  

    def initialize
        @score = 0
        @frame_count = 0
        @rounds = 10
        @pins = 0
    end

    def self.frame(pins)
        return @pins if self.finished?
        @pins += pins
        @rolls += 1
    end

    def self.finished?
        @rolls == 2
    end

end

Bowling.frame(10)


