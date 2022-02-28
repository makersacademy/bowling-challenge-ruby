require 'frame'

class Scoreboard

  attr_accessor :game_score, :throw_scores, :throw_outcome

  def initialize(frame = Frame.new)
    @frame = frame
    @game_score = 0
    @throw_scores = []
    @throw_outcome = []
  end

  def single_roll(pins)
    raise "you have attempted to add too many throws" if @frame.current_frame == 11
    @throw_scores << pins
    raise "Single throw recorded for throw #{@throw_scores.count} is invalid" if illegal_pins?(pins)
    frame_outcome = @frame.single_roll(pins)
    if frame_outcome != :incomplete
      add_frame(frame_outcome)
      @frame.start_next
    end
  end

  def add_frame(outcome)
      add_strike if outcome == :strike
      add_spare if outcome == :spare
      add_other if outcome == :other
      add_three if outcome == :three
  end

  def score
    calculate_score if legitimate_game?
    return @game_score
  end

  def calculate_score
    # calculate sum of pins downed
    (0..(@throw_scores.length-1)).each do |i|
      @game_score += @throw_scores[i]
    end
    # calculate bonus for next throw (ie first strike and spare bonus)
    (0..(@throw_scores.length-2)).each do |j|
      if @throw_outcome[j] == :strike || @throw_outcome[j] == :spare
        @game_score += throw_scores[j+1]
      end
    end
    # calculcate additional strike bonus
    (0..(@throw_scores.length-3)).each do |j|
      if @throw_outcome[j] == :strike
        @game_score += throw_scores[j+2]
      end
    end
    @game_score
  end

  private

  def illegal_pins?(pins)
    pins < 0 || pins > 10
  end

  def legitimate_game?
    @throw_scores.length == @throw_outcome.length
  end

  def add_strike
    @throw_outcome << :strike
  end

  def add_spare
    @throw_outcome << :score
    @throw_outcome << :spare
  end

  def add_other
    @throw_outcome << :score
    @throw_outcome << :score
  end

  def add_three
    @throw_outcome << :score
    @throw_outcome << :score
    @throw_outcome << :score
  end

end