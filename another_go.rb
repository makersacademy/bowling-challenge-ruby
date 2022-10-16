class Frame

    attr_reader :pins,:rolls,:frames, :game_score, :strike_bonus, :frame_score, :total_score

    def initialize()
        @rolls = 0
        @pins = 0           
        @frame_score = Array.new
        @game_score = Array.new
        @total_score = Array.new
        @strike_bonus = false
    end

    def pins_down(pins)

        if strike?(pins)
            strike = [10,0]           
            @game_score << strike
            @frame_score = Array.new            
            @total_score << 10


        elsif rolls == 1
            #p @frame_score.count

            @frame_score << pins
            @game_score << @frame_score            
            @rolls = 0
            @frame_score = Array.new

        else
            #p frame_score.count
            @frame_score << pins
            @rolls += 1
        end
    end 

    def strike_logic
    end

    def spare_logic
    end

    # def finished?
    #     @rolls == 2
    # end             

    def finished?
        @frame_score.count == 2
    end

    def strike?(pins)
        @rolls == 0 && pins == 10
    end

end

frame = Frame.new

frame.pins_down(10)
frame.pins_down(3)
frame.pins_down(3)
frame.pins_down(4)
frame.pins_down(4)
frame.pins_down(5)
# frame.pins_down(4)
# frame.pins_down(1)


p "Frame rolls #{frame.rolls}"
p "Number of frames = #{frame.frames}"
p "Current frame scores = #{frame.pins}"
p "Frame score = #{frame.frame_score}"
p "Game score = #{frame.game_score}"
p "Total score = #{frame.total_score}"

# aaa = [10,6,8]

# aaa[0]=15

# p aaa


