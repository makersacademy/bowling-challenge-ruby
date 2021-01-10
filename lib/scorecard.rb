
@score_board = []
@frames = (0..9).to_a
@total_score = 0

@frames.each do |frame|
  puts "Round ##{frame}"
  puts "First roll. Enter the number of pins"
  @first_roll = gets.chomp.to_i
  @score_board[frame] = [@first_roll] #update the board
  @total_score += @first_roll # score += 10
  p @score_board
  p "total score:"
  p @total_score
  if frame == 9
    if @first_roll == 10
      @second_roll = gets.chomp.to_i
      @score_board[frame] << @second_roll
      @total_score += @second_roll
      if @second_roll + @first_roll == 10
        @bonus_roll = gets.chomp.to_i
        @score_board[frame] << @bonus_roll
      end
    else
      puts "Second roll. Enter the number of pins"
      @second_roll = gets.chomp.to_i
      @score_board[frame] << @second_roll
      @total_score += @second_roll
      p @score_board
    p "total score:"
    p @total_score
      if @score_board[frame].sum == 10
        puts "Bonus roll. Enter the number of pins"
        @bonus_roll = gets.chomp.to_i
        @score_board[frame] << @bonus_roll
        @total_score += @bonus_roll
        p @score_board
        p "total score:"
        p @total_score
      end
    end
  else
    if frame != 0 && @score_board[frame-1].first == 10
      @total_score += @first_roll
    elsif frame != 0 && @score_board[frame-1].sum == 10
      @total_score += @first_roll
    end
    if @first_roll == 10
      next # skip 
    else
    puts "Second roll. Enter the number of pins"
    @second_roll = gets.chomp.to_i
    @score_board[frame] << @second_roll
    @total_score += @second_roll
    if frame != 0 && @score_board[frame-1].first == 10
      @total_score += @second_roll
    end
    p @score_board
    p "total score"
    p @total_score
  end
end
end