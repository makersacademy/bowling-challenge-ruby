class ScoreSheet
  def initialize(game)
    @game = game
  end

  def print
    raise "The game must be completed to print the scorecard" unless @game.complete?
    puts "FRAME | ROLLS | TOTAL SCORE"
    @game.frames.each_with_index do |frame, index|
      print_frame(frame, index + 1)
    end
  end

  private

  def print_frame(frame, number)
    symbols = frame.rolls.map { |score| score == 0 ? '-' : score }
    case frame.status
    when :strike
      roll_string = "X    "
    when :spare
      roll_string = "#{symbols.first} , /"
    else
      roll_string = "#{symbols.first} , #{symbols.last}"
    end

    current_total = @game.frames[0...number].sum(&:score)

    puts " %2d.  | %5s | %3d" % [number, roll_string, current_total]
  end
end
