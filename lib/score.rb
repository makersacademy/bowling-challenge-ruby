class Score
    def initialize(first_roll, second_roll)
        @first_roll = first_roll
        @second_roll = second_roll
        @current_score = 0
        @frame = 1
    end

    def count 
        @current_score += @first_roll + @second_roll
    end

    def spare(first_of_next)
        @current_score += 10 + first_of_next
    end
    
    def strike(first_of_next, second_of_next)
        @current_score += 10 + first_of_next + second_of_next
    end

    def run
      while @frame < 11 
        puts "This is frame #{@frame}. Add your score"
        puts "Frame #{@frame}, roll 1:"
        @first_roll = gets.chomp.to_i
        if @first_roll == 10
            puts "This is a strike, add the next two knocked down pins"
            @first_of_next = gets.chomp.to_i
            @second_of_next = gets.chomp.to_i
            puts "Your current score is: #{strike(@first_of_next, @second_of_next)}"
        else
            puts "Frame #{@frame}, roll 2:"
            @second_roll = gets.chomp.to_i
            if @first_roll + @second_roll < 10
                puts "Your current score is #{count}"
            else
                puts "Next knocked down pins:"
                @first_of_next = gets.chomp.to_i
                puts "Your current score is #{spare(@first_of_next)}"
            end
        end
        @frame += 1
      end
    end
end

score = Score.new(0,0)
score.run