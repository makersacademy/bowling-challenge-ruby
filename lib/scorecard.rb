class Scorecard

  attr_reader :frame, :scorecard, :score

  def initialize
    @frame = 1
    @scorecard = {}
    @score = 0
  end

  def roll(number)
    raise 'This score is invalid' if number > 10 || !no_rolls_in_frame && ((first_roll_score + number) > 10)

    if no_rolls_in_frame
      @scorecard[@frame] = [number] 
      @score += 10 if (@scorecard.length > 1) && (strike? || spare?) && number == 10
      @frame += 1 if number == 10
      # add a bit about if you get a strike and roll before was a spare/strike then double it
    elsif first_roll_done
      @scorecard[@frame] << number
      if (@scorecard.length > 1) && strike?
        @score += @scorecard[@frame].sum
      elsif (@scorecard.length > 1) && spare?
        @score += @scorecard[@frame][0]
      end
      @frame += 1
    end
    @score += number
  end

  def print_scorecard
    @scorecard.each { |k, v| puts "Frame #{k} => Roll 1: #{v[0]}, Roll 2: #{v[1]}" }
    puts "Total score: #{@score}"
  end

  private

  def no_rolls_in_frame
    @scorecard[@frame].nil?
  end

  def first_roll_done
    @scorecard[@frame].length == 1
  end

  def first_roll_score
    @scorecard[@frame].join.to_i
  end

  def strike?
    @scorecard[@frame - 1].length == 1 && @scorecard[@frame - 1][0] == 10
  end

  def spare?
    @scorecard[@frame - 1].length == 2 && @scorecard[@frame - 1].sum == 10
  end

end


