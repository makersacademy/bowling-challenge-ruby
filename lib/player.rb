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
    @frame_count += 1
    p "Bonuses"
    p @bonus_1
    p @bonus_2
    @scores.push([roll_1 * @bonus_1, roll_2 * @bonus_2])
    strike_spare(roll_1, roll_2)
    check_bonus
    scorecard
    p "Bonuses after roll"
    p @bonus_1
    p @bonus_2
    frame_check
  end

  def frame_check
    if @frame_count == 10
      final_roll
    end
  end


  def check_bonus
    if @strike == true
      @bonus_1 = 2
      @bonus_2 = 2
    elsif @spare == true
      @bonus_1 = 2
      @bonus_2 = 1
    else
      @bonus_1 = 1
      @bonus_2 = 1
    end
  end

  def final_roll
    if @final_frame == false && @strike == true
      @final_frame = true
      @frame_count = 8
    elsif @final_frame == false &&@spare == true
      @final_frame = true
      @frame_count = 9
    else
      @final_frame = true
      @frame_count = 10
      scorecard
    end
  end

  def strike_spare(roll_1, roll_2)
    if roll_1 == 10
      strike_rolled
    elsif roll_1 + roll_2 == 10
      spare_rolled
    else
      @strike = false
      @spare = false
    end
  end

  def strike_rolled
    puts "Strike!"
    @strike = true
  end


  def check_spare(roll_1 ,roll_2)
    if roll_1 + roll_2 == 10
      puts "Spare!"
      @spare = true
    end
  end

    def spare_rolled
      puts "Spare!"
      @spare = true
    end

  def scorecard
    get_scores
    get_total
  end

  def get_scores
    @scores.each do |score|
      puts "#{name}: frame #{@frame_count} - roll 1: #{score[0]}, roll 2: #{score[1]}"
    end
  end

  def get_total
    @total = 0
    @scores.each do |score_1, score_2|
      @total += score_1 + score_2
    end
    puts "#{name}'s total is #{@total}"
  end


end
