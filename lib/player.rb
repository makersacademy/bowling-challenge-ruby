class Player

  attr_reader :name, :scores, :total, :strike, :spare, :bonus_1, :bonus_2, :frame_count, :final_frame

  def initialize(name)
    @name = name
    @scores = Array.new
    @total = 0
    @strike = false
    @spare = false
    @bonus_1 = 1
    @bonus_2 = 1
    @frame_count = 0
    @final_frame = false
  end

  def frame(roll_1, roll_2)
    frame_check
    check_bonus
    @scores.push([roll_1 * @bonus_1, roll_2 * @bonus_2])
    strike_spare(roll_1, roll_2)
  end

  def frame_check
    @frame_count += 1
    # if @frame_count == 10 && @last_frame == false
    #   final_strike
    #   @last_frame = true
    # end
    if @frame_count == 10
      @final_frame = true
    end 
  end


  def check_bonus
    if @strike == true
      @bonus_1 = 2
      @bonus_2 = 2
    elsif @spare == true
      @bonus_1 = 2
      @bonus_2 = 1
    end
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
