require './lib/frame'
require './lib/score_card'

class Game

  def initialize(score_card: ScoreCard.new )
    @score_card = score_card
    @frame_counter = 0
  end

  def start_game
    new_frame
  end

  def new_frame(frame: Frame.new)
    @frame_counter += 1
    @frame = frame
    frame_run
  end

  def frame_run
    @frame.start_roll(pins_request)
    if (@frame.bonus == 'spare') || (@frame.bonus == 'strike')
      @frame.frame_scores << 0
    else
      @frame.start_roll(pins_request)
    end
    finish_frame
  end

  def finish_frame
    @frame.frame_scores << @frame.bonus
    @score_card.frame_result(@frame.frame_scores)
    @score_card.print_scores
    if @frame_counter < 10
      new_frame
    else
      bonus(@frame.bonus, @frame_counter)
    end
  end

  def finish_game
    puts "GUTTER GAME score: #{@score_card.total_score}" if @score_card.total_score == 0
    puts "PERFECT GAME score: #{@score_card.total_score}" if @score_card.total_score  == 300
    @score_card.print_scores
  end


  def pins_request
    puts "How many pins did you knock down"
    pins = gets.chomp.to_i
  end

  def bonus(bonus, round)
    if (bonus == 'strike') && (round == 10)
      new_frame
    elsif (bonus == 'strike') && (round == 11)
      new_frame
    elsif (bonus == 'spare') && (round == 10)
      new_frame
    else
      finish_game
    end
  end
end