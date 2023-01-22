require_relative 'lib/scorecard'

scores = [[10], [2, 3], [4, 5], [6, 4], [7, 2], [9, 1], [0, 0], [0, 10], [5, 5], [0, 5]]

scorecard = Scorecard.new
total = scorecard.calculate(scores)

p total
