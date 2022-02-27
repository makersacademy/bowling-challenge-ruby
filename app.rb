require './lib/scorecard'
require './lib/frame'

scorecard = Scorecard.new
frame = Frame.new(0,0)
puts "START A BOWLING GAME"


2.times do 
  while frame.frame_end == false do 
    puts "ENTER YOUR  PIN COUNT" 
    user_input = gets.chomp
    frame.roll(user_input.to_i)
    #puts " FRAME IS   = '#{frame.frame}'"
    #puts " FRAME END IN LOOP = '#{frame.frame_end}'"
    thescorecard = scorecard.score(frame.frame,frame.frame_end,frame.standard_roll,frame.strike_count)
   # puts "OUT OF LOOP"
  end

  puts "OUT OF LOOPSCORECARD  '#{scorecard.scorecard}'"
  frame = Frame.new(0,0)
end
puts "FINAL GAME SCORE IS '#{scorecard.game_total}'"