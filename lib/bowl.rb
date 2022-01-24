class Bowl 

    attr_reader :rolls

    def initialize 
        @rolls = [
            {frame:1, roll_one: 0, roll_two: 0, total_roll: 0},
            {frame:2, roll_one: 0, roll_two: 0, total_roll: 0},
            {frame:3, roll_one: 0, roll_two: 0, total_roll: 0},
            {frame:4, roll_one: 0, roll_two: 0, total_roll: 0},
            {frame:5, roll_one: 0, roll_two: 0, total_roll: 0},
            {frame:6, roll_one: 0, roll_two: 0, total_roll: 0},
            {frame:7, roll_one: 0, roll_two: 0, total_roll: 0},
            {frame:8, roll_one: 0, roll_two: 0, total_roll: 0},
            {frame:9, roll_one: 0, roll_two: 0, total_roll: 0},
            {frame:10, roll_one: 0, roll_two: 0, total_roll: 0}
        ]
        @frames = 1
    end 

    def first_roll(pins_one)
        @rolls[@frames -1][:roll_one] = pins_one
    end 

    def second_roll(pins_two)
        @rolls[@frames -1][:roll_two] = pins_two

    end

end 