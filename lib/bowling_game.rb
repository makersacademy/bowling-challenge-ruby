class BowlingGame
  def initialize(io, frame)
    @score_board = new_board_handler(frame)
    @io = io
    @frame = 0
  end

  def play(score)
    return if is_ended?()
    current_frame = @score_board[@frame]
    current_frame.add_score(score)
    current_frame.is_ended? && @frame += 1
  end

  def print_score
    if is_ended?()
      @io.puts "Game ended! Your total score: #{calculate_total_score()}."
    else
      @io.puts "Your current score: #{calculate_total_score()}."
    end
  end

  def calculate_total_score
    accum_score = 0
    @score_board.each_with_index do |frame, i|
      if i < 9
        case frame.status
        when "strike"
          accum_score += frame.total_score + @score_board[i + 1].scores[0] + @score_board[i + 1].scores[1]
        when "spare"
          accum_score += frame.total_score + @score_board[i + 1].scores[0]
        else
          accum_score += frame.total_score
        end
      else
        accum_score += frame.total_score
      end
    end
    return accum_score
  end

  private

  def is_ended?
    return @frame == 10
  end

  def new_board_handler(frame)
    new_board = []
    9.times { new_board.push(frame.new(false)) }
    new_board.push(frame.new(true))
    return new_board
  end
end
