require_relative './frame'

class Game
  attr_reader :current_turn, :game_score, :current_frame, :frames

  def initialize
    @current_turn = 0
    @game_score = 0
    @frames = []
  end

  def start_new_frame
    @current_turn += 1
    @current_frame = Frame.new
  end

  def roll_current_frame(first_roll, second_roll = 0)
    @current_frame.add_roll_score(first_roll) #first roll
    @current_frame.add_roll_score(second_roll) unless second_roll.zero? #second roll provided first roll wasn't a strike
    mark_current_frame? #mark this roll as strike or spare if appropriate
  end

  def mark_current_frame?
    @current_frame.mark_as_strike?
    @current_frame.mark_as_spare?
  end

  def end_current_frame
    update_frame_score
    @frames << @current_frame
    @current_frame = nil
    update_game_score
  end

  def update_game_score
    @game_score = 0
    @frames.each do |frame|
      @game_score += frame.total_score
    end
  end

  def add_final_bonus(first_roll = 0, second_roll = 0)
    if @frames[-2].strike == true && @frames[-1].strike == true #last 2 frames are strikes
      final_frame_strike_bonus(first_roll, second_roll)
      @frames[-2].total_score += first_roll
    elsif @frames[-1].strike == true #last frame is a strike
      final_frame_strike_bonus(first_roll, second_roll)
    elsif @frames[-1].spare == true #last frame is a spare
      @frames[-1].add_roll_score(first_roll)
      @frames[-1].set_total_score
    end
  end

  private

  def update_frame_score
    @current_frame.set_total_score if current_turn >= 1 #adds knocked pins to current frame score
    if current_turn >= 2
      @frames[-1].total_score += @current_frame.throws[0] if @frames[-1].spare == true #adds spare bonus for previous roll if applicable
      @frames[-1].total_score += @current_frame.total_score if @frames[-1].strike == true #adds strike bonus to previous roll if applicable
    end
    if current_turn >= 3
      @frames[-2].total_score += @current_frame.throws[0] if @frames[-1].strike == true && @frames[-2].strike == true #finishes strike bonus in case of consecutive strikes
    end
  end

  def final_frame_strike_bonus(first_roll, second_roll)
    @frames[-1].add_roll_score(first_roll) #first roll
    @frames[-1].add_roll_score(second_roll)
    @frames[-1].set_total_score
  end
end
