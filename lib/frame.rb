
class Frame

    PIN_COUNT = 10
    FRAME_LIMIT = 10

    attr_reader :frame, :frame_number, :shots

    def initialize
        @frame_number = []
        @remaining_pins = PIN_COUNT
        @shots = []
    end

    def self.new_frame(*start_pins)
        @frame = []
        start_pins = PIN_COUNT
        @frame << start_pins
    end

    def played?
        @remaining_pins == 0 || shots.length == 2
    end

    def bowl(*shot)
        @shots << shot
        return @shots.flatten.inject(:+)
    end

    def strike?
        return true if shots.first == PIN_COUNT
    end

    def spare?
        !strike? && remaining_pins == 0
    end

    def end_game
        "Game over you scored score" if last_frame? == true
    end

    def last_frame?
        return true if @frame_number = FRAME_LIMIT
    end
end