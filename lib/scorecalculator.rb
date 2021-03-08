require_relative './frame.rb'

class ScoreCalculator
  def initialize(frameclass = Frame)
    @sheet = []
    @frameclass = frameclass
  end

  def input(*args)
    errors(*args)
    @sheet << @frameclass.new(*args)
    bonuspoints
    puts "You scored #{@sheet.last.total} for frame #{currentframe}. Your overall score so far is #{currentscore}"
    specialannouncement
    reset if completegame?
  end

  def scoreboard
    score = 0
    @sheet.map.with_index do |x, i|
      puts "Frame #{i + 1}: #{x.frame} | #{x.total} | #{score += x.total}"
    end
  end

  private

  def errors(*args)
    raise 'Score in the frame cannot exceed 10!' if currentframe < 9 && args.sum > 10
    raise "Max of 2 score inputs allowed if you haven't striked/spared in frame 10" if currentframe == 9 && args.length > 2 && ((args[0] + args[1]) < 10)
    raise "Max of 2 score inputs allowed if you haven't striked/spared!" if args.length > 2 && currentframe < 9
    raise 'Only 1 score input allowed if it includes a strike' if args.include?(10) && currentframe < 9 && args.length > 1
    raise "You need to input both scores of the current frame if you don't have a strike" if args.length == 1 && args != [10]
  end

  def bonuspoints
    # for continuous strikes
    if @sheet.length >= 3 && @sheet[currentframe - 3].is_strike? && @sheet[currentframe - 2].is_strike?
      @sheet[currentframe - 3].add(@sheet.last.frame.first)
    end
    # for a spare
    if @sheet[currentframe - 2].is_spare? && @sheet.length > 1
      @sheet[currentframe - 2].add(@sheet.last.frame.first)
    end
    # for a strike
    if @sheet[currentframe - 2].is_strike? && @sheet.length > 1
      @sheet[currentframe - 2].add(@sheet.last.values[0..1])
    end
  end

  def currentscore
    score = 0
    @sheet.each do |x|
      score += x.frame.flatten.sum
    end
    score
  end

  def currentframe
    @sheet.length
  end

  def perfectgame?
    currentscore == 300
  end

  def guttergame?
    currentframe == 10 && currentscore == 0
  end

  def specialannouncement
    puts 'Congrats you scored a perfect game!' if perfectgame?
    puts 'Sorry this is a complete gutter game...' if guttergame?
    puts 'You have finished the game, yay!' if !perfectgame? && !guttergame? && currentframe == 10
  end

  def completegame?
    @sheet.length == 10
  end

  def reset
    @sheet = []
  end
end
