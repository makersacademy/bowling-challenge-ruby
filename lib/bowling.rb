class Bowling
  attr_reader :knocked_down, :first_roll, :scores , :final_scores, :frame, :spares, :strikes, :extra_turn
  def initialize
    @scores = create_score_sheet
    @final_scores = create_score_sheet
    @first_roll = true
    @frame = 1
    @knocked_down = 0
    @spares = []
    @strikes = []
    @extra_turn = false
    @tenth_frame_rolls = 0
  end

  def roll(pins)
    @knocked_down += pins
    return tenth_frame(pins) if frame == 10
    scores[frame] << pins
    update_bonus_points(pins)
    
    if first_roll 
      return strike if knocked_down == 10
    else
      spares << frame if knocked_down == 10
      @frame += 1
      @knocked_down = 0
    end
    update_scores
    change_roll
  end

  # Allows bowling to be played on irb - uncomment lines 127 & 128
  def play
    while true
      puts "What did you score?"
      input = gets.chomp.to_i
      output = roll(input)
      if output == "Game over!"
        puts "Game over, here is your final scorecard"
        calculate_final_scores
        p @final_scores
        break
      else
        puts "Here's your scoresheet broken down - Updated scores not implemented yet!"
        p @scores
      end
    end
  end

  # Calculates scores for each frame at the end of the game for now
  def calculate_final_scores
    @final_scores = create_score_sheet
    for i in 1..10
      i == 1 ? @final_scores[1] << @scores[1].sum : @final_scores[i] << (@scores[i] + @final_scores[i - 1]).sum
    end
  end

  # Update scores works for a perfect game but not for any other games.
  # Had trouble with figuring out the logic for other games - bugs.
  def update_scores
    current_frame = frame - 1
    if @tenth_frame_rolls > 0
      current_frame += @tenth_frame_rolls
    end
    if @first_roll && current_frame > 2
      if current_frame == 3
        @final_scores[current_frame - 2] << @scores[current_frame - 2].sum        
      else
        @final_scores[current_frame - 2] << (@scores[current_frame - 2] + @final_scores[current_frame - 3]).sum
      end
    end
  end
  
  def tenth_frame(pins)
    @tenth_frame_rolls += 1
    if scores[10].length < 1
      update_bonus_points(pins)
      scores[10] << pins
    elsif scores[10].length == 1
      scores[10] << pins
      scores[frame - 1] << pins if strikes.include?(frame - 1)
      if knocked_down == 10 || pins == 10
        @extra_turn = true
      else
        update_scores
        return "Game over!"
      end
    elsif scores[10].length == 2
      scores[10] << pins
      update_scores
      return "Game over!"
    else
      return "Game over!"
    end
    update_scores
  end

  def strike
    strikes << frame
    @frame += 1
    @knocked_down = 0
    update_scores
  end

  def update_bonus_points(pins)
    scores[frame - 1] << pins if strikes.include?(frame - 1)
    if @first_roll
      scores[frame - 2] << pins if strikes.include?(frame - 2) && strikes.include?(frame - 1)
      scores[frame - 1] << pins if spares.include?(frame - 1)
    end
  end

  def create_score_sheet
    hash = {}
    for i in 1..10
      hash[i] = Array.new
    end
    hash
  end

  def change_roll
    @first_roll = !first_roll
  end

end

# bowling = Bowling.new
# bowling.play 