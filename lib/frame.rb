require './lib/roll'

class Frame
  
  attr_reader :rolls

  @@frames = []

  def initialize
    @rolls = []
  end

  def run_frame
    @rolls << first_roll
    return Frame.frames.last if @rolls[0] == 10
    @rolls << second_roll
    Frame.frames.length == 10 && (@rolls.reduce(0, :+) >= 10) ? @rolls << third_roll : Frame.frames.last
    Frame.frames.last
  end

  def first_roll
    puts "first roll"
    roll = Roll.new.roll
    puts "STRIKE!" if roll == 10
    roll
  end

  def second_roll
    puts "second roll"
    roll = Roll.new.roll
    puts "Spare" if (roll + @rolls[0]) == 10
    if (roll + @rolls[0]) > 10
      puts "sum of both rolls is greater than 10. play second roll again"
      second_roll
    end
    roll
  end

  def third_roll
    puts "third roll"
    roll = Roll.new.roll
    puts "STRIKE!" if roll == 10
    roll
  end

  def self.frames 
    @@frames
  end

end