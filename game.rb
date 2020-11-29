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
    while @frame < 3 do
      play_frame
    end
    # play_frame_10
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
    # final_score
  end

  def reset_frame
    @pins = 10
    @frame += 1
    @game_rolls << @frame_rolls
    @frame_rolls = []
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

  def current_score
    if @game_rolls[-1][0] + @game_rolls[-1][1] == 10
      return 'score depends on next frame'
    else
      frames_scores.sum
    end
  end

  def frames_scores
    @game_rolls.map.with_index do |frame_rolls, index|
      if @game_rolls[index][0] == 10
        (10 + @game_rolls[index + 1].sum)
      elsif @game_rolls[index].sum == 10
        (10 + @game_rolls[index + 1][0])
      else
        frame_rolls.sum
      end
    end
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
      roll_3_10
    elsif @roll_1_10 + @roll_2_10 > 10
      roll_3_10_a
    else
    end
  end
end
