require_relative 'scorecard'
require_relative 'score'

class Round

    attr_reader :round1, :round2
    def initialize
        p 'What was your first score?'
        @round1 = gets.chomp().to_i
        if @round1 == 10
            p 'STRIKE!!!'
            @round2 = 0
        else 
            p 'What was your second score?'
            @round2 = gets.chomp().to_i
            if @round1 + @round2 == 10
                p 'SPARE!!!'
            end
        end
    end



end