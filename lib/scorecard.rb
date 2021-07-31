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
      @frame += 1 if number == 10
    elsif first_roll_done 
      @scorecard[@frame] << number
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

end
