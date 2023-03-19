require 'player'

class Game
  def initialize(player_name, io)
    @player = Player.new(player_name)
    @scorecard = []
    @frame_number = 0
    @io = io
  end

  def player
    return @player
  end

  def scorecard
    return @scorecard
  end

  def play_frame
    frame = Frame.new(@player)
    @io.puts 'roll one'
    @io.puts 'enter the number of pins knocked down'
    x = @io.gets.chomp.to_i
    frame.roll_one(@player.roll(x))

    if frame.stats[:special] != 'STRIKE'
      @io.puts 'roll two'
      @io.puts 'enter the number of pins knocked down'
      y = @io.gets.chomp.to_i
      frame.roll_two(@player.roll(y))
    end

    @scorecard << frame.stats

    # spare and strike conditions
    
    if @scorecard[@scorecard.size-2][:special] == 'SPARE'
      @scorecard[@scorecard.size-2][:score] += x
    end

    if @scorecard[@scorecard.size-2][:special] == 'STRIKE' && frame.stats[:special] == 'none'
      @scorecard[@scorecard.size-2][:score] += x
      @scorecard[@scorecard.size-2][:score] += y
    end

    if @scorecard[@scorecard.size-2][:special] == 'STRIKE' && frame.stats[:special] == 'STRIKE'
      @scorecard[@scorecard.size-2][:score] += x
    end

    if @scorecard.size > 3
      if @scorecard[@scorecard.size-2][:special] == 'STRIKE' && @scorecard[@scorecard.size-3][:special] == 'STRIKE'
        @scorecard[@scorecard.size-3][:score] += x
      end
    end
    
    # tenth frame conditions
    if @frame_number == 10 && frame.stats[:special] == 'SPARE' 
      @io.puts 'roll three'
      @io.puts 'enter the number of pins knocked down'
      z = @io.gets.chomp.to_i
      frame.frame_ten_roll_three(@player.roll(z))
    end

    if @frame_number == 10 && frame.stats[:special] == 'STRIKE' 
      @io.puts 'roll two'
      @io.puts 'enter the number of pins knocked down'
      y = @io.gets.chomp.to_i
      frame.frame_ten_roll_two(@player.roll(y))
      if @scorecard[@scorecard.size-2][:special] == 'STRIKE'
        @scorecard[@scorecard.size-2][:score] += y
      end
      


      @io.puts 'roll three'
      @io.puts 'enter the number of pins knocked down'
      z = @io.gets.chomp.to_i
      frame.frame_ten_roll_three(@player.roll(z))
    end
  end

  def play_game
    10.times do 
      @frame_number += 1
      play_frame 
    end
    p @scorecard
    return 
  end

  def game_result
    @scorecard.each do |frame|
      player.add_to_score(frame[:score])
    end
    return player.final_score
  end
end