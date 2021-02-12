# frozen_string_literal: true

class Player
  attr_reader :name, :scores, :total, :strike, :spare, :frame_count, :final_frame

  def initialize(name)
    @name = name
    @scores = []
    @total = 0
    @strike = false
    @spare = false
    @frame_count = 0
    @final_frame = false
  end

  def frame(roll_1, roll_2 = 'x')
    @frame_count += 1
    save_score(roll_1, roll_2)
    strike_spare(roll_1, roll_2)
    frame_check
    print_score
  end

  def save_score(roll_1, roll_2)
    @scores.push([roll_1, roll_2])
  end

  def frame_check
    p @frame_count
    if @frame_count == 10
      final_roll
    end
  end

  def final_roll
    if @final_frame == false && @strike == true || @final_frame == false && @spare == true
      @frame_count = 9
    else
      @frame_count = 10
      scorecard
    end
    @final_frame = true
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
    puts 'Strike!'
    @strike = true
  end

  def spare_rolled
    puts 'Spare!'
    @spare = true
  end

  def scorecard
    p "final frame"
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
      score_2 = 0 if score_2 == 'x'
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
    second_roll = @scores[index + 1][0] if second_roll == 'x'
    @total += first_roll + second_roll
  end

  def spare_points(index)
    @total += @scores[index][0]
  end

  def print_score
    frame = 1
    @scores.each do |score_1, score_2|
      puts "#{name} - frame #{frame}: #{score_1}, #{score_1}"
      frame += 1
    end
  end


  def reset
    @scores = []
    @frame_count = 0
    @final_frame = false
  end
end
