class Frame
    attr_accessor :roll1, :roll2

    def total
        return roll2 == nil ? roll1 : roll1 + roll2
    end

end