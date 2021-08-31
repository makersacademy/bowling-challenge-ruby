require_relative 'scorecard'
require_relative 'score'

class LastRound

    attr_reader :round1, :round2, :round3
    def initialize
        p 'What was your first score?'
        @round1 = gets.chomp().to_i
        if @round1 == 10
            p 'STRIKE!!!'
        end
        p 'What was your second score?'
        @round2 = gets.chomp().to_i
        if @round2 == 10
            p 'STRIKE!!!'
        elsif @round1 + @round2 == 10
            p 'SPARE!!!'
        end
        if @round2 == 10 || @round1 + @round2 = 10
            p 'What was your final score?'
            @round3 = gets.chomp().to_i
        else
            @round3 = 0
        end
    end
end