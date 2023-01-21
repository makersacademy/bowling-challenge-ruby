class BowlingGame
#game initializes with 0 rolls     
def initialize 
    @rolls = []
end 
#record number of pins knocked down in a roll. Pins are passed as argument
def roll(pins)
    @rolls.push(pins)
end
#this method calculates total score for the whole game(10 frames)
def score
    score = 0
    throw_index = 0 
    10.times do 
        if strike(throw_index)
            score += 10 + strike_bonus(throw_index)
            throw_index += 1
        elsif spare(throw_index)
            score += 10 + spare_bonus(throw_index)
            throw_index += 2
        else 
            score += @rolls[throw_index] + @rolls[throw_index + 1]
            throw_index += 2
        end
    end
    score
end 

end

private 

def strike(throw_index)
    @rolls[throw_index] == 10
end

def spare(throw_index)
    @rolls[throw_index] + @rolls[throw_index + 1] == 10
end

def strike_bonus(throw_index)
    @rolls[throw_index + 1] + @rolls[throw_index + 2]
end

def spare_bonus(throw_index)
    @rolls[throw_index + 2]
end
