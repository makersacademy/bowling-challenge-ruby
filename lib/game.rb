require_relative './frame'

class Game

MAX_FRAMES = 10
MAX_POINTS = 10

attr_accessor :scorecard
@scorecard = []
    def initialize
        @scorecard = []
    end
end