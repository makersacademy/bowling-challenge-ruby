require 'frame'

class Game
    def initialize
        @frames = []
        @frames_played = 0
    end

    def add_frame(frame)
        return 'START NEW GAME' if @frames_played == 10
        @frames << frame
        @frames_played += 1
        return nil
    end

    def calculate_score
        total = 0
        @frames.each do |frame|
            sum = frame.roll1 + frame.roll2
            total += sum
        end
        return total
    end

    def frames_played
        return @frames_played
    end
end