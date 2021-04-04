
class Frame

    PIN_COUNT = 10

    attr_reader :frame, :frame_number

    def initialize(*frame_number)
        @frame_number = frame_number
    end

    def self.new_frame(start_pins)
        @frame = []
        start_pins = PIN_COUNT
        @frame << start_pins
    end

    def last_frame?
        return true if @frame_number == 10
    end
end