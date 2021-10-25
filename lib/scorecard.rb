class Scorecard
  attr_reader :current, :frame_count

  def initialize
    @frame_count = 1
    @current = [
      { frame_number: 1, roll1: 0, roll2: 0, bonus: 0, frame_total_score: 0 },
      { frame_number: 2, roll1: 0, roll2: 0, bonus: 0, frame_total_score: 0 },
      { frame_number: 3, roll1: 0, roll2: 0, bonus: 0, frame_total_score: 0 },
      { frame_number: 4, roll1: 0, roll2: 0, bonus: 0, frame_total_score: 0 },
      { frame_number: 5, roll1: 0, roll2: 0, bonus: 0, frame_total_score: 0 },
      { frame_number: 6, roll1: 0, roll2: 0, bonus: 0, frame_total_score: 0 },
      { frame_number: 7, roll1: 0, roll2: 0, bonus: 0, frame_total_score: 0 },
      { frame_number: 8, roll1: 0, roll2: 0, bonus: 0, frame_total_score: 0 },
      { frame_number: 9, roll1: 0, roll2: 0, bonus: 0, frame_total_score: 0 },
      { frame_number: 10, roll1: 0, roll2: 0, bonus: 0, frame_total_score: 0 },
      { frame_number: 11, roll1: 0, roll2: 0, bonus: 0, frame_total_score: 0 },
      { frame_number: 12, roll1: 0, roll2: 0, bonus: 0, frame_total_score: 0 }
    ]
  end

  def enter_roll1(number)
    array_ref = @frame_count - 1
    @current[array_ref][:roll1] = number
  end

  def enter_roll2(user_input)
    array_ref = @frame_count - 1
    @current[array_ref][:roll2] = user_input
  end

  def print_current_frame
    array_ref = @frame_count - 1
    puts "Frame number: #{@current[array_ref][:frame_number]}"
    puts "Frame roll 1: #{@current[array_ref][:roll1]}"
    puts "Frame roll 2: #{@current[array_ref][:roll2]}"
    puts "Frame bonus: #{@current[array_ref][:bonus]}"
    puts "Frame total score: #{@current[array_ref][:frame_total_score]}"
  end

  def frame_count_next
    @frame_count += 1
  end


  # the bonus calc is not working at the moment
  # it gets called in Bowling.scorecard_entry every frame
  # so the bonuses of the previous frame should still get updated.
  def bonus_calc
    array_ref = @frame_count - 1
    (0..array_ref).each do |n|
      if @current[n][:roll1] == 10
        @current[n][:bonus] == @current[n + 1][:roll1] + @current[n + 1][:roll2]
      elsif @current[n][:roll1] + @current[n][:roll2] == 10
        @current[n][:bonus] == @current[n + 1][:roll1]
      end
    end
  end

  def frame_totals_calc
    array_ref = @frame_count - 1
    (0..array_ref).each do |n|
      @current[n][:frame_total_score] = @current[n][:roll1] + @current[n][:roll2] + @current[n][:bonus]
    end
  end

  def total_score
    @current.sum { |hash| hash[:frame_total_score] }
  end

  # the idea here was to make the :bonus keys show 'pending' so that
  # the player knows that they are due extra points for that frame.
  # however that would interfere with the frame_totals_calc method at the moment.
  # def bonus_pending
  #   if @current[array_ref][:roll1] == 10
  #     @current[array_ref][:bonus] == 'pending'
  #   elsif @current[array_ref][:roll1] + @current[array_ref][:roll2] == 10
  #     @current[array_ref][:bonus] == 'pending'
  #   end
  # end
end
