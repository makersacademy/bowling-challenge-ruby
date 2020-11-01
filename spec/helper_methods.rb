
def set_up_score_tracker
  @tracker = ScoreTracker.new
  @scores = @tracker.scores
  @totals = @tracker.totals
end

def add_two_rolls
  @tracker.add_roll('5')
  @tracker.add_roll('2')
end