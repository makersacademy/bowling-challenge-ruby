class Bowling
  attr_reader :rolls

  def initialize
    @rolls = []
  end

  def frame(roll_one, roll_two = 'strike')
    if roll_one == 10
      @rolls << {first: roll_one}
    else
      @rolls << {first: roll_one, second: roll_two}
    end
  end
  
end