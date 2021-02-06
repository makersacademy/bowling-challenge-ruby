class Player

  attr_reader :name, :scores, :total, :strike, :spare

  def initialize(name)
    @name = name
    @scores = Array.new
    @total = 0
    @strike = false
    @spare = false
  end

  def frame(roll_1, roll_2)
    strike_spare(roll_1, roll_2)
    @scores.push([roll_1, roll_2])
  end

  def strike_spare(roll_1, roll_2)
    if roll_1 == 10
      strike_rolled
    elsif roll_1 + roll_2 == 10
      spare_rolled
    end
  end

  def strike_rolled
    puts "Strike!"
    @strike = true
  end

  def spare_rolled
    puts "Spare!"
    @spare = true
  end

  def check_spare(roll_1 ,roll_2)
    if roll_1 + roll_2 == 10
      puts "Spare!"
      @strike = true
    end
  end

  def scorecard
    get_scores
    get_total
  end

  def get_scores
    frame = 0
    @scores.each do |score|
      frame += 1
      puts "#{name}: frame #{frame} - roll 1: #{score[0]}, roll 2: #{score[1]}"
    end
  end

  def get_total
    @scores.each do |score_1, score_2|
      @total += score_1 + score_2
    end
    puts "#{name}'s total is #{@total}"
  end


end
