class Game
  attr_reader :score, :frame, :game_rolls
  attr_accessor :pins, :frame_rolls, :game_rolls

  def initialize
    @score = 0
    @frame = 1
    @pins = 10
    @frame_rolls = []
    @game_rolls = []
  end

  def play
    while @frame < 10 do
      play_frame
    end
    play_frame_10
    @game_rolls # temporary placement until final scores method is written
    # final_score
  end

  def play_frame
    play_roll_1
    play_roll_2 if @roll_1 < 10
    reset_frame
    current_score
  end

  def play_frame_10
    play_roll_1_10
    play_roll_2_decider
    play_roll_3_decider
  end

  def play_roll_1
    puts 'First roll: How many pins did you knock down?'
    @roll_1 = gets.chomp.to_i

    while @roll_1 > 10 do
      puts 'Invalid entry'
      puts 'First roll: How many pins did you knock down?'
      @roll_1 = gets.chomp.to_i
    end
    if @roll_1 == 10
      puts 'STRIKE!'
      puts 'Your score for this frame will be determined by the next frame'
      @frame_rolls << @roll_1
      @frame_rolls << 0
    else
      @pins -= @roll_1
      puts "#{@pins} pins remaining!"
      @frame_rolls << @roll_1
    end
  end

  def play_roll_2
    puts 'Second roll: How many pins did you knock down?'
    @roll_2 = gets.chomp.to_i

    while @roll_2 > @pins do
      puts 'Invalid entry'
      puts 'Second roll: How many pins did you knock down?'
      @roll_2 = gets.chomp.to_i
    end
    if @roll_2 == @pins
      puts 'SPARE!'
      puts 'Your score for this frame will be determined by the next frame'
      @frame_rolls << @roll_2
    else
      puts "You hit #{@roll_2} pins!"
      @frame_rolls << @roll_2
    end
  end

  def play_roll_1_10
    puts 'First roll: How many pins did you knock down?'
    @roll_1_10 = gets.chomp.to_i

    while @roll_1_10 > 10 do
      puts 'Invalid entry'
      puts 'First roll: How many pins did you knock down?'
      @roll_1_10 = gets.chomp.to_i
    end
    if @roll_1_10 == 10
      puts 'STRIKE!'
      @frame_rolls << @roll_1_10
      @pins = 10
    else
      @pins -= @roll_1_10
      puts "#{@pins} pins remaining!"
      @frame_rolls << @roll_1_10
    end
  end

  def play_roll_2_10
    puts 'Second roll: How many pins did you knock down?'
    @roll_2_10 = gets.chomp.to_i

    while @roll_2_10 > 10 do
      puts 'Invalid entry'
      puts 'Second roll: How many pins did you knock down?'
      @roll_2_10 = gets.chomp.to_i
    end
    if @roll_2_10 == 10
      puts 'STRIKE!'
      @pins = 10
      @frame_rolls << @roll_2_10
    else
      @pins -= @roll_2_10
      puts "#{@pins} pins remaining!"
      @frame_rolls << @roll_2_10
    end
  end

  def play_roll_2_10_a
    puts 'Second roll: How many pins did you knock down?'
    @roll_2_10_a = gets.chomp.to_i

    while @roll_2_10_a > @pins do
      puts 'Invalid entry'
      puts 'Second roll: How many pins did you knock down?'
      @roll_2_10_a = gets.chomp.to_i
    end

    if @roll_2_10_a == @pins
      puts 'SPARE!'
      @pins = 10
      @frame_rolls << @roll_2_10_a
    else
      puts "You hit #{@roll_2_10_a} pins!"
      @frame_rolls << @roll_2_10_a
      @frame_rolls << 0
    end
  end

  def play_roll_3_10
    puts 'Bonus roll: How many pins did you knock down?'
    @roll_3_10 = gets.chomp.to_i

    while @roll_3_10 > 10 do
      puts 'Invalid entry'
      puts 'Bonus roll: How many pins did you knock down?'
      @roll_3_10 = gets.chomp.to_i
    end
    if @roll_3_10 == 10
      puts 'STRIKE!'
      @pins -= @roll_3_10
      @frame_rolls << @roll_3_10
    else
      @pins -= @roll_3_10
      @frame_rolls << @roll_3_10
    end
  end

  def play_roll_3_10_a
    puts 'Bonus roll: How many pins did you knock down?'
    @roll_3_10_a = gets.chomp.to_i

    while @roll_3_10_a > @pins do
      puts 'Invalid entry'
      puts 'Bonus roll: How many pins did you knock down?'
      @roll_3_10_a = gets.chomp.to_i
    end

    if @roll_3_10_a == @pins
      puts 'SPARE!'
      @pins = 0
      @frame_rolls << @roll_3_10_a
    else
      @frame_rolls << @roll_3_10_a
    end
  end

  def current_score
    if @game_rolls[-1][0] + @game_rolls[-1][1] == 10
      return 'score depends on next frame'
    else
      frames_scores
    end
  end

  def frames_scores
    score = 0
    for index in 0..(@game_rolls.length - 1)
      if @game_rolls[index][0] == 10
        score += (10 + @game_rolls[index + 1].sum)
      elsif @game_rolls[index].sum == 10
        score += (10 + @game_rolls[index + 1][0])
      else
        score += @game_rolls[index].sum
      end
    end
    score
  end

  def final_score
    game_score = 0
    for index in 0..8
      p 'in the index 0 to 8 area'
      if @game_rolls[index][0] == 10
        game_score += (10 + @game_rolls[index + 1].sum)
      elsif @game_rolls[index].sum == 10
        game_score += (10 + @game_rolls[index + 1][0])
      else
        game_score += @game_rolls[index].sum
      end
    end
    p 'about to add in score for final frame'
    game_score += @game_rolls[9].sum
  end

  def reset_frame
    @pins = 10
    @frame += 1
    @game_rolls << @frame_rolls
    @frame_rolls = []
    @game_rolls
  end

  def play_roll_2_decider
    if @roll_1_10 == 10
      play_roll_2_10
    else
      play_roll_2_10_a
    end
  end

  def play_roll_3_decider
    if @roll_1_10 + @roll_2_10 = 20 || @roll_1_10 + @roll_2_10_a = 10
      play_roll_3_10
    elsif @roll_1_10 + @roll_2_10 > 10
      play_roll_3_10_a
    else
    end
  end
end
