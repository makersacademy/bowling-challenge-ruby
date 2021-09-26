require_relative './frame'

class Scorecard
  def self.start_game(name)
    @game = Scorecard.new(name)
    @game.frames << Frame.new
  end

  def self.current_game
    @game
  end

  def self.bowl
    if @game.frames[-1].frame_finished
      @game.next_frame
      @game.frames[-1].bowl
    else
      @game.frames[-1].bowl
    end
  end

  attr_reader :name, :frames

  def initialize(name)
    @name = name
    @frames = []
  end

  def score
    @frames.map { |frame| frame.frame_score }.sum
  end

  def next_frame
    @frames << Frame.new
  end

  def frames_played
    @frames.count
  end
end
