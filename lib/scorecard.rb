class Scorecard
  attr_reader :scorecard

  def initialize
    @scorecard = []
  end

  def frame_score
    frame = @scorecard.last
    frame_score = frame.bowl1 + frame.bowl2.to_i
    frame.add_score(frame_score)

    bonus = check_for_bonus_score(@scorecard.length)
    if bonus
      puts "You scored #{frame_score} this round. Plus #{bonus} added to previous bowls, for a total of #{frame_score + bonus}.\n"
    else
      puts "You scored #{frame_score} this round.\n"
    end

    if frame.bowl3
      frame.add_score(frame.bowl3)
      puts "You scored an additional #{frame.bowl3} for that final extra bowl!\n\n"
    end
    puts
  end

  def check_for_bonus_score(frame_number)
    if frame_number > 1 && @scorecard[-2].bowl1 != 10 && @scorecard[-2].bowl1 + @scorecard[-2].bowl2.to_i == 10 
      @scorecard[-2].add_score(@scorecard.last.bowl1)
      puts "Bonus score: #{@scorecard.last.bowl1} added to previous bowl for spare!"
      @scorecard.last.bowl1
    elsif frame_number == 2 && @scorecard[-2].bowl1 == 10
      @scorecard[-2].add_score(@scorecard.last.bowl1 + @scorecard.last.bowl2.to_i)
      puts "Bonus score: #{@scorecard.last.bowl1 + @scorecard.last.bowl2.to_i} added to previous bowl for strike!"
      @scorecard.last.bowl1 + @scorecard.last.bowl2.to_i
    elsif frame_number > 2 && @scorecard[-2].bowl1 == 10 && @scorecard[-3].bowl1 == 10
      @scorecard[-3].add_score(@scorecard.last.bowl1)
      @scorecard[-2].add_score(@scorecard.last.bowl1 + @scorecard.last.bowl2.to_i)
      puts "Bonus score: #{@scorecard.last.bowl1} added to strike two turns ago!"
      puts "Bonus score: #{@scorecard.last.bowl1 + @scorecard.last.bowl2.to_i} added to previous bowl for strike!"
      (@scorecard.last.bowl1 * 2 )+ @scorecard.last.bowl2.to_i
    elsif frame_number > 2 && @scorecard[-2].bowl1 == 10 && @scorecard[-3].bowl1 != 10
      puts "Bonus score: #{@scorecard.last.bowl1 + @scorecard.last.bowl2.to_i} added to previous bowl for strike!"
      @scorecard.last.bowl1 + @scorecard.last.bowl2.to_i
    end
  end

  def total_score
    puts "\n ===== Final Summary ======"
    total = 0
    @scorecard.each do |frame|
      total += frame.score
      puts "Frame #{frame.frame_number} score: #{frame.score}"
    end
    puts "\nTotal score: #{total}"

    if total == 300
      puts "\n\n==== YOU SCORED A PERFECT GAME! ====\n\n"
    elsif total == 0
      puts "\n\n==== GUTTERBALL! ====\n\n"
    end
  end

end