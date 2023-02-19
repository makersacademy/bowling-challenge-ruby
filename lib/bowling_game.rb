class BowlingGame
  def initialize(io, frame) # frame is class
    @score_board = new_board_handler(frame)
    @io = io
    @frame = 0
  end

  def play(hits) # hits is an Integer
    return if is_ended?()
    current_frame = @score_board[@frame]
    current_frame.add_score(hits)
    current_frame.is_ended? && @frame += 1
  end

  def print_score
    if is_ended?()
      @io.puts "Game ended! Your total score: #{calculate_total_score()}."
    else
      @io.puts "Your current score: #{calculate_total_score()}."
    end
  end

  private

  def calculate_total_score
    accum_score = 0
    @score_board.each_with_index do |frame, i|
      # Check if it's the first 9 frames
      if i < 9
        case frame.status
        when "strike"
          # adds up the current frame plus the next 2 rolls
          accum_score += frame.total_score + @score_board[i + 1].scores[0] + @score_board[i + 1].scores[1]
        when "spare"
          # adds up the current frame plus the next roll
          accum_score += frame.total_score + @score_board[i + 1].scores[0]
        else
          # if it's not a strike or spare
          accum_score += frame.total_score
        end
      else
        # if it's the 10th
        accum_score += frame.total_score
      end
    end
    return accum_score
  end

  # Check if the game has ended
  def is_ended?
    return @frame == 10
  end

  # Create an array with nine [0, 0] plus one [0, 0, 0] for the 10th frame
  def new_board_handler(frame) # frame is a class
    new_board = []
    9.times { new_board.push(frame.new(false)) }
    new_board.push(frame.new(true))
    return new_board
  end
end
