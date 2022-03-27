class Game

  def initialize
    @running_score = 0
    @array_of_each_throw = []
    @array_of_each_rack = []
    @racks_completed = 0
    @current_rack_score = 0
    @second_roll = false
    @third_roll = false
    @first_roll_score = nil
    @second_roll_score = nil
    @final_rack = false
    @final_rack_first_roll_strike = false
    @final_rack_second_roll_spare = false
  end

  def roll(n)
    if @third_roll == true
      final_rack_third_roll(n)
    elsif @final_rack == true && @second_roll == false
      final_rack_first_roll(n)
    elsif @final_rack == true && @second_roll == true
      final_rack_second_roll(n)
    elsif @third_roll == true
      final_rack_third_roll(n)
    elsif @second_roll == false
      first_roll(n)
    else
      second_roll(n)
    end
  end

  def what_rack_is_it?
    if @racks_completed == 0
      puts "You are in the #{@racks_completed + 1}st rack"
    elsif @racks_completed == 1
      puts "You are in the #{@racks_completed + 1}nd rack"
    elsif @racks_completed == 2
      puts "You are in the #{@racks_completed + 1}rd rack"
    elsif @racks_completed == 10
      puts "The game is over!"
    else
      puts "You are in the #{@racks_completed + 1}th rack"
    end
  end

  private

  def first_roll(n)
    @current_rack_score = 0
    if n > 10
      raise "There are only 10 pins in a bowling alley"
    end
    @first_roll_score = n
    if n == 10
      strike(n)
    else
      @current_rack_score += n
      add_throw(n)
      @second_roll = true
    end
  end

  def second_roll(n)
    if @first_roll_score + n > 10
      raise "There are only 10 pins in a bowling alley"
    elsif @first_roll_score + n == 10
      spare(n)
    else
      @current_rack_score += n
      add_throw(n)
      add_rack
      rack_score_message
      @racks_completed += 1
      @running_score += @current_rack_score
      @second_roll = false
      score_and_rack_message
      check_for_final_rack
    end
  end

  def strike(n)
    puts "STRIKE"
    @current_rack_score += n
    add_throw(n)
    add_rack
    rack_score_message
    @racks_completed += 1
    @running_score += @current_rack_score
    score_and_rack_message
    check_for_final_rack
  end

  def spare(n)
    puts "SPARE"
    @current_rack_score += n
    add_throw(n)
    add_rack
    rack_score_message
    @racks_completed += 1
    @running_score += @current_rack_score
    @second_roll = false
    score_and_rack_message
    check_for_final_rack
  end

  def add_throw(n)
    @array_of_each_throw << n
  end

  def add_rack
    @array_of_each_rack << @current_rack_score
  end

  def rack_score_message
    puts "You scored #{@current_rack_score} in the most recent rack!"
  end

  def score_and_rack_message
    puts "After #{@racks_completed} racks your score is #{@running_score}!"
  end

  def check_for_final_rack
    if @racks_completed == 9
      puts "It's time for the final rack!!!"
      begin_final_rack
    end
  end

  def begin_final_rack
    @final_rack = true
  end

  def final_rack_first_roll(n)
    @current_rack_score = 0
    puts "It's the first roll of the final rack"
    if n > 10
      raise "There are only 10 pins in a bowling alley"
    end
    @first_roll_score = n
    if n == 10
      @final_rack_first_roll_strike = true
      final_rack_strike(n)
      @second_roll = true
    else
      @current_rack_score += n
      add_throw(n)
      @second_roll = true
    end
  end

  def final_rack_second_roll(n)
    puts "It's the second roll of the final rack"
    if @first_roll_score + n > 10
      raise "There are only 10 pins in a bowling alley"
    end
    @second_roll_score = n
    @second_roll = false
    if n == 10
      @final_rack_second_roll_strike = true
      final_rack_strike(n)
      @third_roll = true
    elsif @first_roll_score + @second_roll_score == 10
      final_rack_spare(n)
      @third_roll = true
    elsif @final_rack_first_roll_strike == true
      @current_rack_score += n
      add_throw(n)
      @third_roll = true
    else
      @current_rack_score += @second_roll_score
      add_throw(n)
      add_rack
      @racks_completed += 1
      @running_score += @current_rack_score
      game_over_message
    end
  end

  def final_rack_third_roll(n)
    puts "It's the third roll of the final rack"
    if @second_roll_score + n > 10
      raise "There are only 10 pins in a bowling alley"
    end
    @third_roll_score = n
    if n == 10
      final_rack_strike(n)
      @running_score += @current_rack_score
      game_over_message
    elsif @second_roll_score + n == 10
      final_rack_spare(n)
      add_rack
      @racks_completed += 1
      @running_score += @current_rack_score
      game_over_message
    else
      @current_rack_score += @second_roll_score
      add_throw(n)
      add_rack
      @racks_completed += 1
      @running_score += @current_rack_score
      game_over_message
    end
  end

  def final_rack_strike(n)
    puts "STRIKE in the final rack, that's clutch!"
    @current_rack_score += n
    add_throw(n)
    @first_roll_score = 0
    @second_roll_score = 0
  end

  def final_rack_spare(n)
    puts "SPARE in the final rack!"
    @current_rack_score += n
    add_throw(n)
    @first_roll_score = 0
    @second_roll_score = 0
  end

  def game_over_message
    puts "The game is over... you scored #{@running_score}"
  end
end