require_relative './controllers'

card = ScoreCard.new

scorer = Scorer.new

scorer.score_game(card)