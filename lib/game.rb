class Game
    # create accessors
    attr_accessor :total_score, :roll_number, :frame, :board, :bonus, :finished

    # initialize with general starting settings
    def initialize
        @finsihed = false
        @total_score = 0
        @roll_number = 1
        @frame = 1
        @board = [[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0,0]]
        @bonus = [0,0,0,0,0,0,0,0,0]
    end

    # add_base_score will be called after each roll to equal the total score to the sum of all the entries in the board array
    def add_base_score
        temp = @board.flatten()
        @total_score = temp.sum
    end

    # add_bonus score will be called after each roll and will add the summed up bonus scores to the total score at the end
    def add_bonus_score

        # run through all the frames/sub-arrays with the index
        @board.each_with_index do |ind_frame, index|

            # if a spare and not in the last frame then make the bonus for that frame equal to the first roll of the next frame
            if ind_frame.sum == 10 && ind_frame[1] != 0 && index !=9
                @bonus[index] = @board[index + 1][0]

            # if a strike and not in the last frame
            elsif ind_frame[0] == 10 && index != 9

                # check if the next frame is also a strike
                case @board[index + 1][0]

                # if a strike then add both the next frames total (the next strike) and the following frames first roll
                when 10
                    @bonus[index] = @board[index + 1][0] + @board[index + 2][0]

                # else just add both rolls from the next frame to the bonus for the original frame
                else
                    @bonus[index] = (@board[index + 1][0] + @board[index + 1][1])
                end
            end
        end
        @total_score += @bonus.sum
    end

    # roll function to handle the number/knocked pins, frame and roll_number within the frame
    def roll(number) 
        
        # if not in the last frame
        if @frame < 10

            # add the knocked pins number into the the array which will have index one less than the actual frame and roll number
            @board[@frame -1][@roll_number - 1] = number

            # if a strike move onto the next frame
            if @roll_number == 1 && number == 10
                @frame += 1

            # if not a strike and that was the first roll, move onto the second roll of the same frame
            elsif @roll_number == 1
                @roll_number = 2 

            # else go onto the next frame because there have been two rolls in this frame and reset the roll number
            else
                @frame +=1
                @roll_number = 1
            end

        # this then has to be the last frame
        else

            # if the roll number is greater than 3 then it is impossible to roll again so do nothing but call the finish function
            if @roll_number > 3
                finish

            # if the roll is greater than two but you haven't got a spare of a strike in those first two then no extra roll, finish
            elsif @roll_number > 2 && @board[@frame -1].sum < 10
                finish
            
            # else you should still have some rolls so knocked pins will be put on the board and roll number increased
            else
                @board[@frame -1][@roll_number - 1] = number
                @roll_number += 1
            end
        end
        # call those defined functions after every roll, potentially could be changed to every frame
        add_base_score
        add_bonus_score
    end

    # function just to change the finished attribute to true and stop anymore score or unwanted game attribute changes
    def finish
        @finished = true
    end
end