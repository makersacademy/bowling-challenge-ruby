class ScoreCalculator
  FRAMES = 10
  attr_reader :score_board, :frames, :total_score

  def initialize
    @score_board = []
    @frames = (0..FRAMES-1).to_a
    @frame_scores = []
  end

  def update_board(frame, pins)
    if @score_board[frame].nil?
      @score_board[frame] = [pins]
    else
      @score_board[frame] << pins
    end
  end

  def update_score(pins)
    @total_score += pins
  end

  def strike?(frame)
    @score_board[frame].first == 10
  end

  def spare?(frame)
    !strike?(frame) && @score_board[frame].sum == 10
  end

  def bonus_roll(frame)
    return nil unless strike?(frame) || spare?(frame)
    puts "Bonus roll. Enter the number of pins"
    @bonus_roll = gets.chomp.to_i
    update_board(@frames.last, @bonus_roll)
  end

  def calculate_frame_score(frame)
    frame_score = @score_board[frame].sum
    frame_score += @frame_scores[frame-1] unless frame == 0
    @frame_scores << frame_score
  end

  def update_previous_frame(frame)
    if strike?(frame-1)
      @frame_scores[frame-1] += @score_board[frame].first
      @frame_scores[frame-1] += @score_board[frame][1]
    elsif spare?(frame-1)
      @frame_scores[frame-1] += @score_board[frame].first
    end
  end

  def roll(current_frame)
    puts "Enter the number of pins"
    roll = gets.chomp.to_i
    update_board(current_frame, roll)
  end

  def update_scores(frame)
    update_previous_frame(frame) unless frame.zero?
    calculate_frame_score(frame)
  end

  def last_round?(frame)

    frame == @frames.last
  end

  def total_score
    @frame_scores.last
  end

  def run
    @frames.each do |current_frame|
      roll(current_frame)
      if strike?(current_frame) && !last_round?(current_frame)
        update_scores(current_frame)
        next
      end
      roll(current_frame)
      bonus_roll(current_frame) if last_round?(current_frame)
      update_scores(current_frame)
    end
  end
end

score = ScoreCalculator.new
score.run