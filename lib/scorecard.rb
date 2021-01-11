class Score 
  FRAMES = 10
  attr_reader :score_board, :frames, :total_score

  def initialize
    @score_board = []
    @frames = (0..FRAMES-1).to_a
    @total_score = 0
  end

  def print_score
    puts @score_board
    puts "total score:"
    puts @total_score
  end

  def update_board(frame, pins)
    if @score_board[frame].nil?
      @score_board[frame] = [pins]
    else
      @score_board[frame] << pins
    end
  end

  def update_score(pins)
    @total_score += pins
  end


def strike?
  @first_roll == 10
end

def spare?
  @first_roll + @second_roll == 10
end

  def run
  @frames.each do |current_frame|
    puts "Round ##{current_frame}"
    puts "First roll. Enter the number of pins"
    @first_roll = gets.chomp.to_i
    # update_board(current_frame, @first_roll)
    # update_score(@first_roll)
    @score_board[current_frame] = [@first_roll] #update the board
    @total_score += @first_roll # score += 10
    print_score
    if current_frame == @frames.last
      if self.strike?
        @second_roll = gets.chomp.to_i
        @score_board[current_frame] << @second_roll
        @total_score += @second_roll
        if self.spare? #spare?
          @bonus_roll = gets.chomp.to_i
          @score_board[current_frame] << @bonus_roll
        end
      else
        puts "Second roll. Enter the number of pins"
        @second_roll = gets.chomp.to_i
        @score_board[current_frame] << @second_roll
        @total_score += @second_roll
        @second_roll = gets.chomp.to_i
      # update_board(current_frame, @second_roll)
      # update_score(@second_roll)
        print_score
        if @score_board[current_frame].sum == 10
          puts "Bonus roll. Enter the number of pins"
          @bonus_roll = gets.chomp.to_i
          @score_board[current_frame] << @bonus_roll
          @total_score += @bonus_roll
          print_score
        end
      end
    else
      if current_frame != 0 && @score_board[current_frame-1].first == 10
        @total_score += @first_roll
      elsif current_frame != 0 && @score_board[current_frame-1].sum == 10
        @total_score += @first_roll
      end
      if @first_roll == 10
        next # skip 
      else
      puts "Second roll. Enter the number of pins"
      # @second_roll = gets.chomp.to_i
      # @score_board[current_frame] << @second_roll
      # @total_score += @second_roll
      if current_frame != 0 && @score_board[current_frame-1].first == 10
        @total_score += @second_roll
      end
      print_score
    end
  end
  end
end

end

