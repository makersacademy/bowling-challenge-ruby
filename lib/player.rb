require_relative 'frame'
require_relative 'bonus'

class Player 

  attr_reader :name, :frames

  def initialize(name)
    @name = name 
    @frames = []
    next_frame
  end 

  def bowl(hits)
    next_frame if @current.complete? 
    @current.bowl(hits)
  end 

  def next_two_bowls(frame_no)
    next_two_frames = frames[(frame_no + 1)..(frame_no + 2)]
    next_bowls = next_two_frames.inject([]) {|bowls, frame| bowls += frame.bowls if frame.finished?} || []
    next_bowls.take(2)
  end

  def score
    initial_frames_score + bonus_frame_score
  end
  
  def bonus_frame_score
    bonus_frame_total = 0
    last_frame = frames.last
    bonus_frame_total += last_frame.score if frames.size == 10 && last_frame.complete?
    bonus_frame_total
  end

  def initial_frames_score
    frame_no = 0
    total_score = 0
    while frame_no < 10 - 1 && frame_no < frames.size
      frame = frames[frame_no]
      break unless frame.complete?
      total_score += total_frame_score(frame, frame_no)
      frame_no += 1
    end
    total_score
  end
  
  def total_frame_score(frame, frame_no)
    total_score = frame.score
    total_score += bonus_scorekeeper(frame, frame_no) if frame.bonus?
    total_score
  end
  
  def bonus_scorekeeper(frame, frame_no)
    total = 0
    two_bowls = next_two_bowls(frame_no)
    if frame.strike? && two_bowls.size == 2
      total += two_bowls.reduce(:+)
    elsif frame.spare? && !two_bowls.first.nil?
      total += two_bowls.first
    end
    total
  end
 
  def scoreboard
    score = 0
    frames.each do |frame|
      frame.bowls.each do |bowl| 
        score += bowl
      end 
      puts "#{@name} scored #{score}"
    end

  end
  
  def complete?
    frames.length == 10 && frames.last.complete?
  end

  attr_reader :current
  attr_writer :frames

  def next_frame
    if frames.length == 10 - 1
      frames << BonusFrame.new
    else
      frames << Frame.new
    end
    @current = frames.last
  end
end 