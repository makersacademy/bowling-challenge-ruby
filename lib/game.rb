class Game
  attr_accessor :current_frame_number
  attr_reader :frames 

  def initialize(frame = Frame)
    @frames = []
    set_up_frames(frame)
    @current_frame_number = 1
    @rolls

  end

  def current_score
    score = 0
    frames.each { |frame| score += frame.score if frame.score }
    score
  end

  def find_frame(number)
    @frames.select { |frame| frame.number == number }.first
  end

  def current_frame
    find_frame(@current_frame_number)
  end

  def next_frame
    return if @current_frame_number == 10
    @current_frame_number += 1
    find_frame(@current_frame_number)
  end

  def previous_frame
    return if @_number == 1
    @current_frame_number -= 1
    find_frame(@current_frame_number )
  end

  def all_rolls

    rolls = @frames.map do |frame|
      frame.rolls
    end 

    rolls.flatten

  end

  def total
    all_rolls
  end

  private

  def set_up_frames(frame)
    number = 1
    10.times do
      @frames << frame.new(number) 
      number += 1
    end
  end

end