require_relative "frame"

class Game

  attr_reader :frames, :scores, :owed_rolls

  def initialize
    @frames = []
    @scores = Hash.new
    @owed_rolls = Hash.new
  end

  def input_roll(pins)
    raise "Game is finished" if finished?

    frame_check

    frames[-1].add_roll(pins)
    scores["frame_#{frames.length}".to_sym] += pins

    owed_rolls.each do |k, v|
      next if v == 0
      scores[k] += pins
      owed_rolls[k] -= 1
    end

    post_roll_message
  end

  def finished?
    frames.length == 10 && frames[-1].completed?
  end

  def total_score
    total_score = 0
    scores.each { |k, v| total_score += v }
    total_score
  end

  private #--------------------------------------------------

  def create_frame
    Frame.new(frames.length + 1)
  end

  def set_up_new_frame
    frames << create_frame
    scores["frame_#{frames.length}".to_sym] = 0
  end

  def frame_check
    if frames.empty?
      set_up_new_frame
    elsif frames[-1].completed?
      owed_rolls["frame_#{frames.length}".to_sym] = frames[-1].owed_rolls
      set_up_new_frame
    end
  end

  def frames_scores_message
    puts "Current scores:"
    frame_scores = ""
    scores.each do |k, v|
      frame_scores += " #{k}: #{v} |"
    end
    puts frame_scores
  end

  def post_roll_message
    frames_scores_message

    if finished?
      puts "Final score: #{total_score}"
      puts "Perfect Game!" if total_score == 300
    else
      puts "Current score: #{total_score}"
    end
  end

end
