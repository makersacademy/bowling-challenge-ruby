class Game

  def initialize
    @strike = false
    @spare =  false
    @total_score = 0
    @current_frame = 1
  end

  def play_a_frame
    puts 'What is your first roll?'
    roll_1 = gets.chomp.to_i
    if roll_1 == 10
       roll_2 = 0
    else 
      puts 'What is your second roll?'
      roll_2 = gets.chomp.to_i
    end
    frame_score = calculate_frame_score(roll_1, roll_2)
    @total_score += frame_score
    
    puts "Your current score is #{@total_score}, not counting any coming bonus!"

    strike?(roll_1)
    spare?(roll_1, roll_2)
    extra_bonus_round?
  end

  def extra_bonus_round?
    if @current_frame == 10 && (@strike == true || @spare == true)
      puts 'You have an extra bonus round!'
      puts 'What is your first roll?'
      roll_1 = gets.chomp.to_i
      puts 'What is your second roll?'
      roll_2 = gets.chomp.to_i
      extra_bonus_points = roll_1 + roll_2
      @total_score += extra_bonus_points 
    end
  end

  def calculate_frame_score(roll_1, roll_2)
    if @strike == true 
      frame_score = (roll_1 + roll_2) * 2
    elsif @spare == true
      frame_score = (roll_1 * 2) + roll_2
    else
      frame_score = roll_1 + roll_2
    end 
    return frame_score
  end 

  def strike?(roll_1)
    if roll_1 == 10
      @strike = true
    else 
      @strike = false
    end
  end

  def spare?(roll_1, roll_2)
    if roll_1 + roll_2 == 10
      @spare = true
    else
      @spare = false
    end 
  end 
  
  def play_a_game
    while @current_frame < 11
      puts "Frame number: #{@current_frame}"
      play_a_frame
      @current_frame += 1
    end
    puts "Game End"
    puts "Total score: #{@total_score}"
  end
  
end

Game.new.play_a_game
