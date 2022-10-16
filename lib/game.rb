require_relative './frame.rb'

class Game
    attr_accessor :frames_all

    def initialise
        @frames_all = []
    end

    def add_frame(frame)
        @frames_all << frame
    end
end