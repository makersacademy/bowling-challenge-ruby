class Game
  attr_reader :current_bowl, :current_frame

  def initialize
    @current_bowl = 1
    @current_frame = 1
    create_frames
  end

  def enter_score(score)
    add_bonus_scores(score)
    @frames[@current_frame - 1].add_score(score)
    @current_bowl = 2 unless score == 10
    @current_frame += 1 if score == 10
  end

  def create_frames
    @frames = []
    10.times { @frames << Frame.new }
  end

  def total_score
    @frames.inject(0) { |sum, frame| sum += frame.total_score }
  end

  private

  def add_bonus_scores(score)
    @frames.each do |frame|
      frame.add_bonus_score(score) if frame.need_bonus?
    end
  end


end
