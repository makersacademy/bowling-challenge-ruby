class Strike

    attr_reader :bonus_points

    def initialize
      @bonus_points = []
    end

    def add_bonus(pins)
      @bonus_points << pins
    end

    def accounted_for?
      return true if bonus_points.length == 2
      false
    end
end
