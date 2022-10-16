require_relative '../lib/ten_pin_score'

class TenPinCon
    def initialize

    end

    def run
        @score = TenPinScore.new
        @score.format_arrays
        roll_counter = 0 
        puts 'New Game'
        9.times do 
            puts 'Enter Roll 0-10'
            loop do
                puts "Please only type numbers 0-10" 
                @input = gets.chomp
                break if (0..10).include?(@input.to_i)
                
            end
            if @input.to_i == 10
                puts 'Strike!'
                @score.add_roll(10)
                @score.add_roll(0)
            else
                @score.add_roll(@input.to_i)
                loop do 
                    @pins_left = (10 - @input.to_i)
                    @input = gets.chomp
                    break if (0..10).include?(@input.to_i) && @input.to_i <= @pins_left
                    puts "Please only type numbers 0-10 number cannot be more than No of pins #{@pins_left}"
                end
                puts "Spare!" if @input.to_i == @pins_left
                @score.add_roll(@input.to_i)
            end
        end
    end
end

new_game = TenPinCon.new
new_game.run
