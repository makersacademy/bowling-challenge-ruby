class Application

  def initialize(io = Kernel, first_bowl_score = 0, second_bowl_score = 0, total_score = 0,
    last_frame_bonus = nil, current_frame_bonus = nil, strike_streak = 0, frame = 1)
    @io = io
    @first_bowl_score = first_bowl_score
    @second_bowl_score = second_bowl_score
    @total_score = total_score
    @last_frame_bonus = last_frame_bonus
    @current_frame_bonus = current_frame_bonus
    @strike_streak = strike_streak
    @frame = frame
  end

  def run

    # add loops to ensure a valid number is added each roll?

    # 1st frame
    # 10.times do
      @io.puts "Frame #{@frame}"
      @io.puts "How many pins were knocked down by the first bowl?"
      @first_bowl_score = @io.gets.chomp.to_i
      if @first_bowl_score == 10
        @second_bowl_score = 0
        @current_frame_bonus = "strike"
        @strike_streak += 1
        @io.puts "Strike!"
      else
        @io.puts "How many pins were knocked down by the second bowl?"
        @second_bowl_score = @io.gets.chomp.to_i
        if (@first_bowl_score + @second_bowl_score) == 10
          @bonus = "spare"
          @strike_streak = 0
          @io.puts "Spare!"
        else
          @bonus = "none"
          @strike_streak = 0
        end
      end

      @io.puts "Total score at the end of frame #{@frame}: #{calculate_score}"
      @last_frame_bonus = @current_frame_bonus
      @frame += 1
    # end

    # if @last_frame_bonus == "spare"

    # elsif @last_frame_bonus == "strike"

    # else
    #   puts "Game over!"
    # end

    # message for gutter game if total_score == 0
    # message for perfect game if total_score == 300
  end

  # to calculate score for first 10 rolls (not potential 11th and 12th bonus rolls)
  def calculate_score
    if @last_frame_bonus == "strike" && @current_frame_bonus == "strike"
      @total_score += 10 if @strike_streak > 2
      @total_score += ((@first_bowl_score + @second_bowl_score) * 2)
    elsif @last_frame_bonus == "strike"
      @total_score += ((@first_bowl_score + @second_bowl_score) * 2)
    elsif @last_frame_bonus == "spare"
      @total_score += ((@first_bowl_score * 2) + @second_bowl_score)
    else
      @total_score += (@first_bowl_score + @second_bowl_score)
    end
    return @total_score
  end

  def calculate_bonus_rolls

  end
end

# Application.new(Kernel).run