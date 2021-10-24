require './lib/score_card'

EXAMPLE_GAME = [
  [1, 4], # 5 frame.sum of index 0
  [4, 5], # 14 frame.sum of index 1
  [6, 4], # 24 frame.sum of index 2 + frame.sum of index 3
  [5, 5], # 34 frame.sum of index 3 + frame.sum of index 4
  [10], # 44  frame.sum of index 4 + frame.sum of index 5
  [0, 1], # 45 frame.sum of index 5
  [7, 3], # 55 frame.sum of index 6 + frame.sum of index 7
  [6, 4], # 65 frame.sum of index 7 + frame.sum of index 8
  [10], # 75 frame.sum of index 8 + frame.sum of index 9
  [2, 8, 6] # index 9    = 91
]

scorecard = ScoreCard.new(EXAMPLE_GAME)
p scorecard.result
