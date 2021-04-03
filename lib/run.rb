require './lib/game'

def run 
  @game = Game.new
  10.times do
    p 'Enter frame results (10 then 0 for strike):'
    @game.frame(gets.chomp.to_i, gets.chomp.to_i)
    print_info
    tenth_frame
  end
end

def tenth_frame
  unless @game.frame_counter == 10 && spare_strike?;
    return; end

  p 'frame 10 second roll:'
  @game.tenth_frame_extra(gets.chomp.to_i, gets.chomp.to_i)
  print_info
  final_roll
end

def final_roll
  return unless @game.state.last == 'strike' && @game.frame_counter < 12

  p 'frame 10 final roll:'
  @game.tenth_frame_extra(gets.chomp.to_i)
  print_info
end

def print_info
  p @game.total
  p @game.frames
  p @game.frames_total
end

def spare_strike?
  @game.state.last == 'spare' || @game.state.last == 'strike'
end
