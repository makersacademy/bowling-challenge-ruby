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
end
