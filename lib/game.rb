require_relative './frame'
require_relative './player'

class Game
  attr_reader :whos_turn, :frame_number, :player_1, :player_2

  def initialize(player_1_name:, player_2_name:)
    @player_1 = Player.new(name: player_1_name)
    @player_2 = Player.new(name: player_2_name)
    @whos_turn = "player_1"
  end

  def game_start #loop will carry out the game
    until @player_2.frame_number == 10 do
      p 'Please input the pin numbers from each roll'
      p 'if a strike was scored, leave roll_2 empty'
      roll_1 = gets.chomp.to_i
      roll_2 = gets.chomp.to_i
      play(roll_1: roll_1, roll_2: roll_2)
      player_readout()
    end
  end

  def play(roll_1:, roll_2: 0)
    frame = Frame.new(roll_1: roll_1, roll_2: roll_2)
    @player_1.add_score(roll_1: frame.roll_1, roll_2: frame.roll_2, total: frame.total) if @whos_turn == "player_1"
    @player_2.add_score(roll_1: frame.roll_1, roll_2: frame.roll_2, total: frame.total) if @whos_turn == "player_2"
    swap_goes()
  end

  def self.instance(player_1_name:, player_2_name:)
    @game ||= self.new(player_1_name: player_1_name, player_2_name: player_2_name)
  end 

private

  def player_readout
    if @whos_turn == "player_2"
      p "#{@player_1.name} score is #{@player_1.score}."
      p "#{@player_1.name} points score is #{@player_1.points} and bonus score #{@player_1.bonus}"
      p "With a total of #{@player_1.total} \n"
    elsif @whos_turn == "player_1"
      p "#{@player_2.name} score is #{@player_2.score}."
      p "#{@player_2.name} points score is #{@player_2.points} and bonus score #{@player_2.bonus}"
      p "With a total of #{@player_2.total} \n"
    end
  end

  def swap_goes
    if @whos_turn == "player_1"
      @whos_turn = "player_2"
    else
      @whos_turn = "player_1"
    end
  end




end
