require_relative '../lib/ten_pin_score'

class TenPinCon
    def initialize

    end

    def input_get
        puts "Enter Roll 0-10, please only type numbers 0-10" 
        input = gets.chomp
        if ("0".."10").include?(input)
            # return input
            @input = input.to_i
            return @input
        else
            input_get
        end
    end

    def input_get_2
        puts "next input number cannot be more than No of pins left: #{@pins_left}"
        input_get
        input_get_2 if @input > @pins_left
    end 

    def strike
        puts 'Strike!'
        @score.add_roll(10)
        @score.add_roll(0)
    end

    def non_strike
        @score.add_roll(@input)
        @pins_left = (10 - @input)
        input_get_2
        puts "Spare!" if @input == @pins_left
        @score.add_roll(@input)
    end

    def run
        @score = TenPinScore.new
        @score.format_arrays
        roll_counter = 0 
        puts 'New Game'
        9.times do 
            input_get
            if @input == 10
                strike
            else
                @score.add_roll(@input)
                @pins_left = (10 - @input)
                input_get_2
                puts "Spare!" if @input == @pins_left
                @score.add_roll(@input)
            end
        end
        input_get
        if @input == 10
            puts 'Strike! Extra 2 rolls!'
            @score.add_roll(10)
            input_get 
            @score.add_roll(@input)
            input_get 
            @score.add_roll(@input)
            puts "Game over"
        else
            @score.add_roll(@input)
            @pins_left = (10 - @input)
            input_get_2
            puts "Spare!" if @input == @pins_left
            @score.add_roll(@input)            
            puts "Extra roll"
            @score.add_roll(@input)
            puts "Game over"
        end
        print @score.total_score 
    end
    
end

new_game = TenPinCon.new
new_game.run
