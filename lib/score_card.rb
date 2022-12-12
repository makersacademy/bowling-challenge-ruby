require_relative 'frame'

class ScoreCard
  def initialize
    @total_score = 0
    @frames = []
    @round = 1
  end

  def current_frame
    @round
  end

  def frames
    @frames
  end
  
  def new_frame(round)
    Frame.new(round)
  end

  def total_score
    @total_score = 0
    @frames.each do |frame|
      @total_score += frame.frame_score
    end
    return @total_score
  end

  def prev_frame
    if @round > 1
    @frames[@round-2]
    else
    "There are no previous rounds"
    end
  end

  def prev_two_frames
    if @round > 2
    @frames[@round-3]
    else
    "There are no previous rounds"
    end
  end

  def play_frame(roll_1, roll_2)
    this_frame = Frame.new(@round)
   
    # roll 1 and 2 would usually be calculated 
    # as follows within the game logic
    # but for testing purposes I need to input them:

    # roll_1 = this_frame.add_frame_total(random(11))
    # roll_2 = this_frame.add_frame_total(random(11))
    if @round == 10 && roll_1 == 10
      this_frame.strike
      this_frame.add_roll_1(roll_1)
      this_frame.add_bonus(10) #in reality num would be rand(11)
      this_frame.add_bonus(10) #in reality num would be rand(11)
      prev_frame.add_bonus(10) #in reality num would be rand(11)
    elsif @round == 10 && (roll_1 + roll_2) == 10 
      this_frame.spare
      this_frame.add_roll_1(roll_1)
      this_frame.add_roll_2(roll_2)
      this_frame.add_bonus(rand(11))
    elsif roll_1 == 10
      this_frame.strike
      this_frame.add_roll_1(roll_1)
      this_frame.add_roll_2(0)
    elsif (roll_1 + roll_2) == 10
      this_frame.spare
      this_frame.add_roll_1(roll_1)
      this_frame.add_roll_2(roll_2)
    else
      this_frame.add_roll_1(roll_1)
      this_frame.add_roll_2(roll_2)
    end

    if @round > 1 && prev_frame.is_strike?
      prev_frame.add_bonus(roll_1 + roll_2)
    end

    if @round > 2 && prev_frame.is_strike? && prev_two_frames.is_strike?
      prev_two_frames.add_bonus(roll_1)
    end

    if @round > 1 && prev_frame.is_spare?
      prev_frame.add_bonus(roll_1)
    end

    @frames << this_frame
    @round += 1
  #  return ''
  end

  def result
    if self.total_score == 0
      "You got a gutter game!"
    elsif @total_score == 300
      "You got a perfect game!!"
    else
      "Well played, you scored: #{self.total_score}"
    end
  end

  # def play_game(roll_1, roll_2)
  #   while @round < 10 do
  #     play_frame(roll_1, roll_2)
  #   end
    
  # end
end


# scoreCard = ScoreCard.new
# # puts "current frame: #{scoreCard.current_frame}"
# # puts "play frame" 
# scoreCard.play_frame(10, 0)
# # puts "array of frames: #{scoreCard.frames}"
# # puts "current frame: #{scoreCard.current_frame}"
# # puts "play frame" 
# scoreCard.play_frame(10, 0)
# # puts "frame number at frames[0]: #{scoreCard.frames[0].frame}"
# # puts "frame number at frames[1]: #{scoreCard.frames[1].frame}"
# # puts "previous frame: #{scoreCard.prev_frame.frame}"
