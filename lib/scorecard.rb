class Scorecard

  attr_reader :frame, :scorecard, :score

  def initialize
    @frame = 1
    @scorecard = {}
    @score = 0
  end

  def roll(number)
    error_if_invalid_num(number)

    case roll_number
    when 1 then roll_1_procedure(number)
    when 2 then roll_2_procedure(number)
    end
    @score += number
  end

  def print_scorecard
    @scorecard.each { |k, v| puts "Frame #{k} => Roll 1: #{v[0]}, Roll 2: #{v[1]}" }
    puts "Total score: #{@score}"
  end

  private

  def roll_number
    @scorecard[@frame].nil? ? 1 : 2
  end

  def roll_1_procedure(number)
    @scorecard[@frame] = [number] 
    @score += 10 if beyond_first_frame && (strike? || spare?) && number == 10
    @frame += 1 if number == 10
  end

  def roll_2_procedure(number)
    @scorecard[@frame] << number
    if beyond_first_frame && strike?
      @score += @scorecard[@frame].sum
    elsif beyond_first_frame && spare?
      @score += @scorecard[@frame][0]
    end
    @frame += 1
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

  def error_if_invalid_num(number)
    raise 'This score is invalid' if number > 10 || roll_number == 2 && ((first_roll_score + number) > 10)
  end

  def beyond_first_frame
    (@scorecard.length > 1)
  end

end
