class Player

  attr_reader :name, :scores, :total, :strike, :spare, :bonus_1, :bonus_2, :frame_count, :final_frame, :strike_track

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
    @strike_track = false
  end

  def frame(roll_1, roll_2 = "x")
    @frame_count += 1
    save_score(roll_1, roll_2)
    strike_spare(roll_1, roll_2)
    # check_bonus
    # scorecard
    frame_check
  end

  # def calculate_score(roll_1, roll_2)
  #   if @final_frame == true && @spare == true
  #     @scores.push([roll_1, roll_2])
  #   elsif @final_frame == true && @strike == true
  #     @scores.push([roll_1, roll_2])
  #   else
  #     @scores.push([roll_1 * @bonus_1, roll_2 * @bonus_2])
  #   end
  # end

  def save_score(roll_1, roll_2)
    @scores.push([roll_1, roll_2])
  end

  def frame_check
    if @frame_count == 10
      final_roll
    end
  end


  def check_bonus
    if @strike == true
      @bonus_1 += 1 unless @bonus_1 == 3
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
      @frame_count = 9
    elsif @final_frame == false && @spare == true
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
      p bonus_1
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
    frame = 0
    @scores.each do |score|
      frame += 1
      puts "#{name}: frame #{frame} - roll 1: #{score[0]}, roll 2: #{score[1]}"
    end
  end

  def get_total
    @total = 0
    basic_points
    bonus_points
    puts "#{name}'s total is #{@total}"
  end

  def basic_points
    @scores.each do |score_1, score_2|
      if score_2 == "x"
        score_2 = 0
      end
      @total += score_1 + score_2
    end
  end

  def bonus_points
    index = 1
    @scores.each do |score_1, score_2|
      if index == 10
        return
      elsif score_1 == 10
        strike_points(index)
      elsif score_1 + score_2 == 10
        spare_points(index)
      end
      index += 1
    end
  end

    def strike_points(index)
      first_roll = @scores[index][0]
      second_roll = @scores[index][1]
      if second_roll == "x"
        second_roll = @scores[index+1][0]
      end
      @total += first_roll + second_roll
    end

    def spare_points(index)
      @total += @scores[index][0]
    end

end
