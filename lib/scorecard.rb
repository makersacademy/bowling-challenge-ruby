class Scorecard

  def get_score
    print 'Enter Score: '
    gets.chomp.to_i
  end

  def title
    puts 'Bowling Scorecard'
  end

  def finish(frames)
    puts "Game Finished - Total Score #{frames.sum{ |frame| frame.score }}"
  end

  def update(frames)
    frames.each_with_index do |frame, i|
      puts "Frame: #{ i + 1 }, Score: #{ frame.score }" unless frame.outstanding_bonus?
      puts "Frame: #{ i + 1 }, Score: pending" if frame.outstanding_bonus?
    end
  end
end