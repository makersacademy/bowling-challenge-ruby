class BowlingGame

    def initialize
        @rolls = []
    end

    def roll(pins)
        @rolls << pins
    end

    def score
        score = 0
        throw_index = 0 
        10.times do 
            if strike(throw_index)
                score += strike_bonus(throw_index)
                throw_index += 1
            elsif spare(throw_index)
                score += spare_bonus(throw_index)
                throw_index += 2
            else 
                score += normal_score(throw_index)
                throw_index += 2
            end
        end
        return score
    end

    private

    def strike(throw_index)
        @rolls[throw_index] == 10
    end

    def spare(throw_index)
        @rolls[throw_index] + @rolls[throw_index + 1] == 10
    end

    def strike_bonus(throw_index)
       10 + @rolls[throw_index + 1] + @rolls[throw_index + 2]
    end

    def spare_bonus(throw_index)
       10 + @rolls[throw_index + 2]
    end

    def normal_score(throw_index)
        @rolls[throw_index] + @rolls[throw_index + 1]
    end

end