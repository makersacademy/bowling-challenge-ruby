class Game
    attr_accessor :total_score, :roll_number, :frame, :board, :bonus, :finished
    def initialize
        @finsihed = false
        @total_score = 0
        @roll_number = 1
        @frame = 1
        @board = [[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0,0]]
        @bonus = [0,0,0,0,0,0,0,0,0]
    end
    def add_base_score
        temp = @board.flatten()
        @total_score = temp.sum
    end

    def add_bonus_score
        @board.each_with_index do |ind_frame, index|
            if ind_frame.sum == 10 && ind_frame[1] != 0 && index !=9
                @bonus[index] = @board[index + 1][0]
            elsif ind_frame[0] == 10 && index != 9
                case @board[index + 1][0]
                when 10
                    @bonus[index] = @board[index + 1][0] + @board[index + 2][0]
                else
                    @bonus[index] = (@board[index + 1][0] + @board[index + 1][1])
                end
            end
        end
        @total_score += @bonus.sum
    end
    def roll(number) 
        case 
        when @frame < 10
            @board[@frame -1][@roll_number - 1] = number
            if @roll_number == 1 && number == 10
                @frame += 1
            elsif @roll_number == 1
                @roll_number = 2 
            else
                @frame +=1
                @roll_number = 1
            end
        when @frame = 10
            if @roll_number > 3
                finish
            elsif @roll_number > 2 && @board[@frame -1].sum < 10
                finish
            else
                @board[@frame -1][@roll_number - 1] = number
                @roll_number += 1
            end
        end
        add_base_score
        add_bonus_score
    end

    def finish
        @finished = true
    end
end