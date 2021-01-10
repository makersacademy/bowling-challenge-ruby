require_relative './frame'
require_relative './game'

class UserInterface
  attr_reader :game

  def initialize
    @game = Game.new
  end

  def play_game
    while @game.current_turn < 10 do
      ask_for_rolls
      rolls = gets.chomp #enter as a string separated by a comma (5,4)
      first_roll = rolls.split(',')[0].to_i
      second_roll = rolls.split(',')[1].to_i
      complete_frame(first_roll, second_roll)
    end
    ask_for_rolls
    final_rolls = gets.chomp #enter as a string separated by a comma (5,4)
    final_first_roll = final_rolls.split(',')[0].to_i
    final_second_roll = final_rolls.split(',')[1].to_i
    complete_frame(final_first_roll, final_second_roll)
    if (@frames[-1].strike == true && @current_frame.strike == true) || (@current_frame.strike == true) || (@current_frame.spare == true)
      ask_for_bonus_rolls
      bonus_rolls = gets.chomp #enter as a string separated by a comma (5,4)
      first_bonus_roll = bonus_rolls.split(',')[0].to_i
      second_bonus_roll = bonus_rolls.split(',')[1].to_i
      @game.add_final_bonus(first_bonus_roll, second_bonus_roll)
    end
  end

  private

  def complete_frame(first_roll, second_roll = 0)
    @game.start_new_frame
    @game.roll_current_frame(first_roll, second_roll)
    @game.end_current_frame
  end

  def ask_for_rolls
    puts 'Please enter your rolls for the frame like so 5,4 or 10,0 for a strike.'
  end

  def ask_for_bonus_rolls
    puts 'If you had any bonus rolls, please enter them now.'
    puts 'If you had one bonus roll, enter 6,0'
    puts 'If you had two bonus rolls, enter 5,3'
  end
end
