class ScoreCalculator
  attr_reader :sheet, :score

  def initialize
    @sheet = []
    @score = 0
  end

  def input(*args)
    @sheet << args
    errors(*args)
    status
    bonuspoints
    puts "You scored #{args.sum} for frame #{currentframe}. Your overall score so far is #{currentscore}"
    resetframe
  end

  def currentscore
    @sheet.flatten.sum
  end

  def currentframe
    @sheet.length
  end

  def resetframe
    @framescore = 0
  end

  def bonuspoints
    # for continuous strikes
    if @sheet.length >= 3 && @sheet[currentframe - 3].first == 10 && @sheet[currentframe - 2].first == 10
      @sheet[currentframe - 3] << @sheet[currentframe - 1].first
    end
    # for a spare
    if @sheet[currentframe - 2].sum == 10 && @sheet[currentframe - 2].first != 10 && @sheet.length > 1
      @sheet[currentframe - 2] << @sheet[currentframe - 1].first
    end
    # for a strike
    if @sheet[currentframe - 2].sum == 10 && @sheet[currentframe - 2].first == 10 && @sheet.length > 1
      @sheet[currentframe - 2] << (@sheet[currentframe - 1][0..1])
    end
    # special rule for last frame strike
  end

  def scoreboard
    score = 0
    @sheet.map.with_index do |x, i|
      puts "Frame #{i + 1}: #{x} | #{x.flatten.sum} | #{score += x.flatten.sum}"
    end
  end

  def status
    puts 'This the last frame!' if currentframe == 10
    raise "You can't input any more score as you've finished the game!" if currentframe > 10
  end

  def errors(*args)
    raise "You cannot have more than two scores for the last frame if you haven't striked or spared" if currentframe == 10 && args.length > 2 && ((args[0] + args[1]) < 10)
    raise "You cannot input score for more than two rolls unless you have a strike/spare in the last frame" if args.length > 2 && currentframe < 9
    raise 'You cannot input another score for the current frame if you had a strike' if args.include?(10) && currentframe < 10 && args.length > 1
  end
end
