require './lib/roll'

class Frame
  
  attr_reader :rolls

  @@frames = []

  def initialize
    @rolls = []
  end

  def run_frame
    @rolls << first_roll
    @rolls << second_roll unless @rolls[0].to_i == 10 && Frame.frames.length != 9
    @rolls << third_roll if Frame.frames.length == 9 && (@rolls.map(&:to_f).reduce(0, :+) >= 10)
    @rolls.each { |roll| Roll.rolls << roll }
  end

  def first_roll
    puts "first roll"
    roll = Roll.new.roll
    puts "STRIKE!" if roll.to_i == 10
    roll
  end

  def second_roll
    puts "second roll"
    roll = Roll.new.roll
    puts "Spare" if (roll.to_i + @rolls[0].to_i) == 10
    if (roll.to_i + @rolls[0].to_i) > 10  && Frame.frames.length != 9
      puts "sum of both rolls is greater than 10. play second roll again"
      second_roll
    end
    puts "STRIKE!" if roll.to_i == 10
    roll
  end

  def third_roll
    puts "third roll"
    roll = Roll.new.roll
    puts "STRIKE!" if roll.to_i == 10
    roll
  end

  def self.frames 
    @@frames
  end

end