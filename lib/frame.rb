class Frame
  NUMBER_OF_PINS = 10
  STRIKE = 2
  SPARE = 1

  attr_accessor :score, :bonus
  def initialize
    @score = 0
    @@all << self
  end

  def complete?
    @score >= NUMBER_OF_PINS
  end

  def outstanding_bonus?
    @bonus > 0 if @bonus
  end

  def roll=(score)
    determine_bonus(score)
    @score += score
    self.class.apply_oustanding_bonuses(score)
  end

  def determine_bonus(score)
    if complete?
      @bonus -= 1
    else
      @bonus = SPARE if @score + score == NUMBER_OF_PINS
      @bonus = STRIKE if score == NUMBER_OF_PINS
    end
  end

  class << self
    @@all = []

    def all
      @@all
    end

    def final_frame
      @@all[-1]
    end

    def final_frame_bonus?
      final_frame.outstanding_bonus? && @@all.length == 10
    end

    def apply_oustanding_bonuses(score)
      @@all[0...-1].each do |frame|
        next unless frame.outstanding_bonus?
        frame.score += score
        frame.bonus -= 1
      end
    end
  end
end
