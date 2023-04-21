require 'frame_repo'

class Scorecard
  def initialize 
    @total_score = 0
  end

  def add_score(score)
    @total_score += score
  end

  def total_score
    return @total_score
  end

  def score_card
    frame = 1
    puts 'Please roll and I will output the scores so far'
    while frame < 10
      puts "Frame: #{frame}"
      puts 'What is roll one?'
      roll_one = gets.chomp.to_i
      @total_score += roll_one
      puts 'What is roll two?'
      roll_two = gets.chomp.to_i
      @total_score += roll_two
      puts "Your score so far is: #{@total_score}"
      frame += 1
    end
    final_score_comment(@total_score)
  end

  def final_score_comment(total_score)
    if @total_score == 300
      puts 'You got a perfect score!'
    elsif @total_score == 0
      puts 'Gutter Ball! Better luck next time.'
    else
      puts "Your final score is: #{total_score}"
    end
  end
end