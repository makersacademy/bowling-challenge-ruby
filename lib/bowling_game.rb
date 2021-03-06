class BowlingGame
    attr_reader :score, :frame

    def initialize
        @score = []
        @frame = 0
    end


    def new_frame(roll_1, roll_2)
        @frame += 1
    end
end