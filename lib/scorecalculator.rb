class ScoreCalculator
  attr_reader :sheet, :score

  def initialize
    @sheet = []
  end

  def input(*args)
    @sheet << args
    errors(*args)
    status_report
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
  end

  def scoreboard
    score = 0
    @sheet.map.with_index do |x, i|
      puts "Frame #{i + 1}: #{x} | #{x.flatten.sum} | #{score += x.flatten.sum}"
    end
  end

  def status_report
    puts 'This the last frame!' if currentframe == 10
    raise "You can't input any more score as you've finished the game!" if currentframe > 10
  end

  def errors(*args)
    raise "Only two score inputs allowed if you haven't striked/spared in frame 10" if currentframe == 10 && args.length > 2 && ((args[0] + args[1]) < 10)
    raise "Only two score inputs allowed!" if args.length > 2 && currentframe < 9
    raise 'Only 1 score input allowed if it includes a strike' if args.include?(10) && currentframe < 10 && args.length > 1
  end
end
