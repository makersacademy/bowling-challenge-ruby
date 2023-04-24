require_relative './models'

class Printer
  attr_accessor :score_card
  def initialize
  end

  def print
    return "Frame 5 - You got a STRIKE!" #This was a dummy print to see if I could test for puts output in RSpec.
  end
end

class Scorer
  def initialize
  end
  
  def score_game(score_card)

    # populate the score card with frame objects to be written to
    for i in (1..10)
      frame = Frame.new(i)
      score_card.frames.push(frame)
    end

    # for each frame, populate each roll with a score.
    for i in (0..8)
      for n in (0..1)
        puts "Please enter the score of your roll from 0-10"
        score = gets.chomp.to_i
        if score == 10
          score_card.frames[i].score.push(10)
          break
        else
          score_card.frames[i].score.push(score)
        end
      end
    end
    for n in (0..1)
      puts "This is the last frame"
      puts "Please enter the score of your roll from 0-10"
      score = gets.chomp.to_i
      score_card.frames[9].score.push(score)
      if n == 1 && score_card.frames[9].score.sum != 10
        score_card.frames[9].score.push(0)
      else
        puts "This is the last frame"
        puts "Please enter the score of your roll from 0-10"
        score = gets.chomp.to_i
        score_card.frames[9].score.push(score)
      end
    end
    puts "Your final score is #{score_card.current_score}"
  end
end