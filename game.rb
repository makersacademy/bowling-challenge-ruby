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

  def current_score
    if @game_rolls[-1][0] + @game_rolls[-1][1] = 10
      return 'score depends on next frame'
    else
      # need to evaluate each array within the array.

      # if [i][0] = 10, add (10 + [i+1][0] + [i+1][1]) to score
      # elsif [i][0] + [i][1] = 10, add 10 + [i+1][0] to score
      # else sum [i][0] & [i][1] <10 sum them and add to score
    end
  end
end
