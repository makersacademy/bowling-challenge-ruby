require_relative './frame'

class Game
  attr_accessor :frames
  attr_reader :grand_total

  def initialize(io=Kernel)
    @io = io
    @frames = []
    10.times { @frames << Frame.new(@io) }
    @gutter_game = false
    @perfect_game = false
    @grand_total = 0
  end

  def gutter_game
    @gutter_game = true
  end

  def gutter_game?
    @gutter_game
  end

  def perfect_game
    @perfect_game = true
  end

  def perfect_game?
    @perfect_game
  end

  def run_game
    for i in 1..9 do
      @io.puts "Frame #{i}:"
      @frames[i-1].play_regular_frame
    end
  
    @io.puts "Frame 10:"
    @frames.last.play_last_frame
  end

  def calculate_score
    award_bonus_points
    award_bonus_points_in_penultimate_frame
    sum_all_points
  end

  def award_bonus_points
    for i in 0..7 do
      # If player made a strike
      if @frames[i].rolls.include?(10)
        @frames[i].bonus_points += @frames[i+1].rolls.first
        # If subsequent frame had two rolls
        if @frames[i+1].rolls.length == 2
          @frames[i].bonus_points += @frames[i+1].rolls.last
        # Else they must have bowled a strike
        else
          @frames[i].bonus_points += @frames[i+2].rolls.first
        end
      # If player made a spare
      elsif @frames[i].rolls.inject(:+) == 10
        @frames[i].bonus_points += @frames[i+1].rolls.first
      end
    end
  end

  def award_bonus_points_in_penultimate_frame
    # If player made a strike
    if @frames[8].rolls.include?(10)
      @frames[8].bonus_points += (@frames.last.rolls.first + @frames.last.rolls[1])
    # If player made a spare
    elsif @frames[8].rolls.inject(:+) == 10
      @frames[8].bonus_points += @frames.last.rolls.first
    end
  end

  def sum_all_points
    @frames.each do |frame|
      @grand_total += frame.rolls.inject(0, :+)
      @grand_total += frame.bonus_points
    end
  end
end