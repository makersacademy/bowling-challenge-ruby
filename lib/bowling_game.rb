require_relative 'score_card'
require_relative 'frame'

scorecard = Scorecard.new

frame = Frame.new
number_of_frames = 0
shot_counter = 0

while number_of_frames < 10 do
  p "Enter the score:"
  user_input = gets.chomp
  user_input = user_input.to_i

  begin
    frame = Frame.new if frame.complete?
    frame.add_roll(user_input)
    frame.tenth_frame = true if number_of_frames == 9
    scorecard.add_frame(frame) if frame.complete?
    number_of_frames += 1 if frame.complete?
  rescue 
    p "Invalid score!"
  else  
    total = scorecard.calculate_current_score
    p "your score = #{total}"
  end
end
p "Game over"