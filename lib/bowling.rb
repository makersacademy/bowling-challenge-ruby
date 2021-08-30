class Bowling


  def initialize
    @rolls = []
  end
  
  def roll(pins)
    @rolls << pins
  end

  def score
    total = 0
    current_roll = 0
    @rolls.each do |roll|
      total += roll
    end
    total
  end

















end