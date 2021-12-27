require './lib/roll'

class Frame
  
  attr_reader :rolls
  attr_accessor :final_frame

  @@frames = []

  def initialize
    @rolls = []
    @final_frame = false
  end

  def run_frame
    @rolls << first_roll
    @rolls << second_roll unless @rolls[0].to_i == 10 && !@final_frame
    @rolls << third_roll if @final_frame && (@rolls.map(&:to_f).reduce(0, :+) >= 10)
    @rolls.each { |roll| Roll.rolls << roll }
  end

  def first_roll
    puts "First roll:"
    @roll = Roll.new.roll
    strike?
    @roll
  end

  def second_roll
    puts "Second roll:"
    @roll = Roll.new.roll
    puts "Spare" if (@roll.to_i + @rolls[0].to_i) == 10
    valid?
    strike?
    @roll
  end

  def third_roll
    puts "Third roll:"
    @roll = Roll.new.roll
    strike?
    @roll
  end

  def valid?
    if (@roll.to_i + @rolls[0].to_i) > 10  && !@final_frame
      puts "\tThe sum of both rolls is greater than 10. Play second roll again"
      second_roll
    end
  end

  def strike?
    puts "STRIKE!" if @roll.to_i == 10
  end

  def self.frames 
    @@frames
  end

end
