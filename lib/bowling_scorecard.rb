class Scorecard

  attr_reader :name, :roll_1, :roll_2, :frames, :frame_total, :current_frame, :frame_number, :bonus_points, :current_frame

  def initialize(name)
    @name = name
    @roll_1 = nil
    @roll_2 = nil
    @frame_total = nil
    @current_frame = []
    @frames = []
  end

  def self.start(name)
    @frames = []
    @frame_number = 0
    @total_score = 0
    @bonus_points = 0
    loop do
      if @frame_number < 9
        @frame_number += 1
        roll_reset
        puts "Frame number #{@frame_number}"
        turn_1
        check_for_strike
        update_frame_score
        check_for_spare
        end_of_frame_updates
        add_strike_bonus
      elsif @frame_number < 10
        @frame_number += 1
        roll_reset
        puts "Frame number #{@frame_number}"
        turn_1
        check_for_strike
        update_frame_score
        check_for_spare
        end_of_frame_updates
      else
        puts @bonus_points
        add_bonus_points
        end_game
        break
      end
    end
  end  

private

  def self.turn_1
    puts "Roll 1"
    @roll_1 = gets.chomp.to_i
    puts "Roll 1: #{@roll_1} pins knocked down"
    if @roll_1 > 10
      loop do
        puts "Roll 1"
        @roll_1 = gets.chomp.to_i
        if @roll_1 > 10 - @roll_1
          puts "C'mon now. That's cheating. Enter what you really scored."
        else
          return @roll_1
        end
      end
    end
  end

  def self.turn_2
    if @roll_1 != 10
      loop do
        puts "Roll 2"
        @roll_2 = gets.chomp.to_i
        if @roll_2 > 10 - @roll_1
          puts "C'mon now. That's cheating. Enter what you really scored."
        else
          return @roll_2
        end
      end
    end
  end

  def self.check_for_strike
    if @roll_1 == 10
      puts "End of frame, you scored a strike!"
    else 
      turn_2
      puts "Roll 2: #{@roll_2} pins knocked down"
    end
  end

  def self.add_strike_bonus
    # if @frame_number > 1 && (@frames[@frame_number-3][0] == 10) && (@frames[@frame_number-2][0] == 10)
    #   @bonus_points += @frame_total + 10
    # elsif @frames[@frame_number-2][0] == 10
    #   @bonus_points += @frame_total
    # end

    puts @frames[@frame_number - 1]
    if ((@frames[@frame_number - 1] != 0) && (@frame_number > 2)) && ((@frames[@frame_number-3][0] == 10) && (@frames[@frame_number-2][0] == 10))
      @bonus_points += @frame_total + 10
    elsif ((@frames[@frame_number - 1] != 0) && (@frame_number > 2)) && (@frames[@frame_number-2][0] == 10)
      @bonus_points += @frame_total
    else
      @bonus_points += 0
    end
  end

  # def self.add_spare_bonus
  #   puts @frames[@frame_number - 2]
  #   if @frames[@frame_number-2] == 10 && @frames[@frame_number-2][0] != 10
  #     @bonus_points += @roll_1
  #   end
  # end

  def self.check_for_spare
    if @roll_1 != 10 && @roll_1 + @roll_2 == 10
      puts "End of frame, nice spare!"
    end
  end

  def self.roll_reset
    @roll_1 = 0
    @roll_2 = 0
    @current_frame = []
    @frame_total = 0
  end

  def self.update_frame_score
    @frame_total = @roll_1 + @roll_2
  end

  def self.frame_score
    @current_frame << @roll_1
    @current_frame << @roll_2
  end

  def self.add_frame_score
    @frames << @current_frame
  end

  def self.update_score(input)
    @total_score += input
  end

  def self.end_of_frame_updates
    update_score(@frame_total)
    frame_score
    add_frame_score
    puts "Frame number #{@frame_number}: #{@frame_total} scored" 
  end

  def self.add_bonus_points
    @total_score += @bonus_points
  end

  def self.end_game
    puts "Your final score is #{@total_score}"
    puts "Frame by frame score breakdown - #{@frames}"
  end
end
