class Game
  attr_reader :whos_turn, :frame_number

  def initialize(player_1_name:, player_2_name:)
    @player_1 = Player.new(name: player_1_name)
    @player_2 = Player.new(name: player_2_name)
    @whos_turn = "player_1"
  end

  def play(roll_1:, roll_2: 0)
    normal_operations()
    frame = Frame.new(roll_1: roll_1, roll_2: roll_2)
    @player_1.add_score(frame[:roll_1], frame[:roll_2], frame[:total]) if @whos_turn == "player_1"
    @player_2.add_score(frame[:roll_1], frame[:roll_2], frame[:total]) if @whos_turn == "player_"
  end

private

  def normal_operations
    swap_goes()
  
  end

  def swap_goes
    @whos_turn = "player_1" if @whos_turn == "player_2"
    @whos_turn = "player_2" if @whos_turn == "player_1"
  end




end
