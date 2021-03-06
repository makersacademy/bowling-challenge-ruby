class ScoreCalculator
  attr_reader :sheet, :score

  def initialize
    @sheet = []
    @score = 0
  end

  def input(*args)
    raise "You must input score for two rolls unless you have a strike" if args != [10] && args.length == 1
    status
    @sheet << args
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

    #for continuous strikes
    if @sheet.length >= 3 && @sheet[currentframe-3].first == 10 && @sheet[currentframe-2].first == 10
      @sheet[currentframe-3] << @sheet[currentframe-1].first
    end
    #for a spare
    if @sheet[currentframe-2].sum == 10 && @sheet[currentframe - 2].first != 10 && @sheet.length > 1
        @sheet[currentframe-2] << @sheet[currentframe - 1].first
    #for a strike
    elsif @sheet[currentframe - 2].sum == 10 && @sheet[currentframe - 2].first == 10 && @sheet.length > 1
        @sheet[currentframe-2] << @sheet[currentframe - 1].sum
    end
  end

  def frame_info(number)
   puts "Frame #{number}: #{@sheet[number-1]} | #{@sheet[number-1].sum}"
  end

  def scoreboard
    score = 0
    @sheet.map.with_index do |x, i|
      puts "Frame #{i+1}: #{x} | #{x.sum} | #{score += x.sum}"
    end
  end

  def status
    puts "This the last frame!" if currentframe == 9
    raise "You can't input any more score as you've finished the game!" if currentframe > 9
  end
end
