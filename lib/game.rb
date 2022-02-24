require 'bowl'

class Game

  def initialize
    @bowl = Bowl.new
  end



  def play
    10.times do
      puts "How many pins would you like to knock out in the first roll"
      pins_one = gets.chomp
      puts "How many pins would you like to knock out in the second roll"
      pins_two = gets.chomp
      @bowl.first_roll(pins_one)
      @bowl.second_roll(pins_two)
    end
    puts @bowl.total_score
  end


  #TODO: Unit test for this class




end
