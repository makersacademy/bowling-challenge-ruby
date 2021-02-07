class Game
    attr_reader :frames
    
    def initialize
        @frames = []
    end

    def add_frame(frame)
        @frames << frame
    end
end