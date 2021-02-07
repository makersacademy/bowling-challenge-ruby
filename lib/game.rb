class Game

  def initialize
    @total_score = 0
    @bowl_history = []
    @strike = false
    @spare = false
    @current_frame = 1
  end


  def play_frame
    puts "Whats is the score of your first bowl?"
    bowl_1 = gets.chomp.to_i
      if bowl_1 == 10
        bowl_2 = 0
      else
        puts "Whats is the score of your second bowl?"
        bowl_2 = gets.chomp.to_i
      end
    frame_score = calculate_frame_score(bowl_1, bowl_2)
    @bowl_history << [bowl_1, bowl_2]
    @total_score += frame_score
    p "Your current score is #{@total_score}, not including pending bonus points ;)"
    # below evaluates whether the current frame is a strike/spare/neither, 
    # so it changes the variable value for the next frame to adjust its scores accordingly
    strike?(bowl_1)
    spare?(bowl_1, bowl_2)
  end

  # def bonus_round
  #   if current_frame
  # end

  def calculate_frame_score(bowl_1, bowl_2)
    if @strike == true
      #this adds the
      score = (bowl_1 + bowl_2) * 2
    elsif @spare == true
      score = (bowl_1 * 2) + bowl_2
    elsif
      score = bowl_1 + bowl_2
    end
    return score
  end


  def strike?(bowl_1)
    if bowl_1 == 10
      @strike = true
    else
      @strike = false
    end
  end

  def spare?(bowl_1, bowl_2)
    if bowl_1 + bowl_2 == 10
      @spare = true
    else
      @spare = false
    end
  end


  def play_game
    while @current_frame < 11
      puts "Frame number: #{@current_frame}"
      play_frame
      @current_frame += 1
    end
    puts "Fun has stoppped folks"
    puts "Total score: #{@total_score}"
  end

end

Game.new.play_game
