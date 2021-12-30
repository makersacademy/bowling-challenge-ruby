require_relative './frame'
require_relative './player'

class Game
  attr_reader :frame_number, :player_1

  def initialize(player_1_name:)
    @player_1 = Player.new(name: player_1_name)
  end

  def game_start 
    until @player_1.frame_number == 10 do
      p 'Put number of pins knocked down in each roll'
      p 'if scored a strike leave roll_2 empty'
      roll_1 = gets.chomp.to_i
      roll_2 = gets.chomp.to_i
      play(roll_1: roll_1, roll_2: roll_2)
    end
  end

  def play(roll_1:, roll_2: 0)
    frame = Frame.new(roll_1: roll_1, roll_2: roll_2)
    @player_1.add_score(roll_1: frame.roll_1, roll_2: frame.roll_2, total: frame.total)
  end

  def player_score
    p "#{@player_1.name} score is #{@player1.points}"
  end
end