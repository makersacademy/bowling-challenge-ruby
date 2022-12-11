Deciding classes

  Two classes:

  Frames and Game 

Designing  classes
  class Frames

    def initialize(first_roll, second_roll)
      @first_roll = first_roll
      @second_roll = second_roll
      @strike = false
      @spare = false
    end

    def is_strike
      if @first_roll == 10
      @strike = true
    end

    def is_spare
      if @first_roll + @second_roll == 10 && @first_roll != 10
      @spare = true
    end
  end


  class Game
    def initialize
      @frames = []
    end

    def calculate_current_score
    end

    def add_frame(first_roll, second_roll)
    if @frames.length < 10
      Frames.new(,)
    end
  end