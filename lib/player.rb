require_relative 'frame'
require_relative 'bonus'

class Player 

  attr_reader :name, :frames,:current

  attr_writer :frames

  def initialize(name)
    @name = name 
    @frames = []
    next_frame
  end 

  def bowl(hits)
    next_frame if @current.complete? 
    @current.bowl(hits)
  end 
 
  def scoreboard
    score = 0
    frames.each do |frame|
      frame.bowls.each do |bowl| 
        score += bowl
      end 
    end
    puts "#{@name} scored #{score}"
  end
  
  def complete?
    frames.length == 10 && frames.last.complete?
  end

  def next_frame
    if frames.length == 10 - 1
      frames << BonusFrame.new
    else
      frames << Frame.new
    end
    @current = frames.last
  end
end 