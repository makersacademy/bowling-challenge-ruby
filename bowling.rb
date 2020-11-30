

class BowlingGame

	attr_reader :frame_count, :total_score

def initialize
	@frame_count = 0     # opening frame count
	@total_score = 0     # opening game score
	@scorecard = []      # array to store all scores during the game

  # puts "welcome to Makers Bowl!"
  # puts "Press 1 to play..."

  user_input = gets.chomp

  if user_input == 1
    play_frame
  else
    # do nothing
  end

end

def play_frame

if @frame_count == 10                 # check the game has not ended
	puts "GAME OVER"
	puts @scorecard
end

@frame_count =+ 1                     # count the frame as played

puts "Frame #{@frame_count}!"

puts "Enter score for Roll 1"

roll1 = gets.chomp.to_i

if roll1 == 10

	@scorecard << roll1

	@total_score =+ 10
	# run bonus logic

elsif roll1 + roll2 = 10
	@total_score =+10
	#run bonus logic
else
	@scorecard << roll1
	@scorecard << roll2
	frame_score = roll1 + roll2
	@total_score = @total_score + frame_score
end

end

end

# divide play_frame into 2 methods: roll1 and roll2
#
