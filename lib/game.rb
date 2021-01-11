class Game
  FRAMES = 10

  def initialize(score_calculator = ScoreCalculator.new)
    @pinboard = []
    @frames = (0..FRAMES-1).to_a
    @score_calculator = score_calculator
  end

  def update_board(frame, pins)
    if @score_board[frame].nil?
      @score_board[frame] = [pins]
    else
      @score_board[frame] << pins
    end
  end
  

  def bonus_roll
    puts "Bonus roll. Enter the number of pins"
    @bonus_roll = gets.chomp.to_i
    update_board(@frames.last, @bonus_roll)
  end


  def run
    @frames.each do |current_frame|
      puts "Enter the number of pins"
      @first_roll = gets.chomp.to_i
      update_board(current_frame, @first_roll)
      p @score_board
      p @frame_scores
      if strike?(current_frame) && !last_frame?(current_frame)
        update_previous_frame(current_frame) unless first_frame?(current_Frame)
        calculate_frame_score(current_frame)
        p @score_board
        p @frame_scores
        next
      end
      puts "Second roll. Enter the number of pins"
      @second_roll = gets.chomp.to_i
      update_board(current_frame, @second_roll)
      if current_frame == @frames.last
        bonus_roll if strike?(current_frame) || spare?(current_frame)
      end
      update_previous_frame(current_frame) unless first_frame?(current_Frame)
      calculate_frame_score(current_frame)
       p @score_board
      p @frame_scores
    end
  end
end