class ScoreCalculator
  attr_reader :sheet, :score

  def initialize
    @sheet = []
    @score = 0
  end

  def input(*args)
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
    if @sheet[currentframe-2].sum == 10 && @sheet[currentframe - 2].first != 10 && @sheet.length > 1
      @sheet[currentframe-2] << @sheet[currentframe - 1].first
    elsif @sheet[currentframe - 2].sum == 10 && @sheet[currentframe - 2].first == 10 && @sheet.length > 1
      @sheet[currentframe-2] << @sheet[currentframe - 1].sum
    end
  end
end
