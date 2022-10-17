require './lib/score_card.rb'
class Frame
attr_accessor :roll_one, :roll_two

    def initialize(roll_one, roll_two)
        @roll_one = roll_one
        @roll_two = roll_two
    end

    def strike?
        @roll_one == 10
    end

    def sum
        @roll_two + @roll_one
    end

    def spare?
        @roll_one != 10 && sum == 10
    end

end