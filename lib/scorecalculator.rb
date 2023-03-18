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
    puts "You scored #{@sheet.last.total} for frame #{framecount}. Your overall score so far is #{currentscore}"
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
    raise 'Score in the frame cannot exceed 10!' if framecount < 9 && args.sum > 10
    raise "Max of 2 score inputs allowed if you haven't striked/spared in frame 10" if framecount == 9 && args.length > 2 && ((args[0] + args[1]) < 10)
    raise "Max of 2 score inputs allowed if you haven't striked/spared!" if args.length > 2 && framecount < 9
    raise 'Only 1 score input allowed if there is a strike first' if args.first == 10 && framecount < 9 && args.length > 1
    raise "You need to input both scores of the current frame if you don't have a strike" if args.length == 1 && args.first != 10
  end

  def bonuspoints
    # for continuous strikes
    if length >= 3 && two_frames_ago.is_strike? && previousframe.is_strike?
      two_frames_ago.add(currentframe.values.first)
    end
    # for a spare
    if previousframe.is_spare? && length > 1
      previousframe.add(currentframe.values.first)
    end
    # for a strike
    if previousframe.is_strike? && length > 1
      previousframe.add(currentframe.values[0..1])
    end
  end

  def currentscore
    score = 0
    @sheet.each do |x|
      score += x.frame.flatten.sum
    end
    score
  end

  def framecount
    @sheet.length
  end

  def perfectgame?
    currentscore == 300
  end

  def guttergame?
    framecount == 10 && currentscore == 0
  end

  def specialannouncement
    puts 'Congrats you scored a perfect game!' if perfectgame?
    puts 'Sorry this is a complete gutter game...' if guttergame?
    puts 'You have finished the game, yay!' if !perfectgame? && !guttergame? && framecount == 10
  end

  def completegame?
    @sheet.length == 10
  end

  def reset
    @sheet = []
  end

  def previousframe
    @sheet[framecount - 2]
  end

  def currentframe
    @sheet.last
  end

  def two_frames_ago
    @sheet[framecount - 3]
  end

  def length
    @sheet.length
  end
end
