require "./lib/frame"

class Scorecard
  attr_reader :board, :total_score

  def initialize
    @board = []
    @total_score = 0
  end

  def add_frame(frame)
    @board << frame
    game_over? ? end_total : total_so_far
  end

  def spare_bonus(frame, bonus)
    return unless frame.spare?
    bonus_point = bonus.rolls[0]
    frame.add_bonus_points(bonus_point)
  end

  def strike_bonus(frame, bonus)
    return unless frame.strike?
    bonus_points = bonus.frame_score
    frame.add_bonus_points(bonus_points)
  end

  def double_strike_bonus(frame, bonus)
    return unless @board[board.index(frame)].strike? && board[board.index(frame) + 1].strike?
    bonus_points = bonus.rolls[0]
    frame.add_bonus_points(bonus_points)
  end

  def apply_bonus(frame)
    spare_bonus(@board[board.index(frame)], @board[board.index(frame) + 1]) if @board[board.index(frame) + 1]
    strike_bonus(@board[board.index(frame)], @board[board.index(frame) + 1]) if @board[board.index(frame) + 1]
    double_strike_bonus(@board[board.index(frame)], @board[board.index(frame) + 2]) if @board[board.index(frame) + 2]
  end

  private

  def total_so_far
    @board.map {
      |frame|
      frame.frame_score
    }.sum
  end

  def end_total
    @board.map {
      |frame|
      apply_bonus(frame)

      p @total_score += frame.frame_score
    }
  end

  def game_over?
    @board.length == 10
  end
end
