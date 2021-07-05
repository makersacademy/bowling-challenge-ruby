def perfect_game
  subject = Bowling.new
  9.times { subject.frame(10) }
  subject.tenth_frame(10, 10, 10)
  [1,2,3,4,5,6,7,8,9].each { |num| subject.score_frame(num) }
  subject.score_tenth_frame
  subject.overall_score
end