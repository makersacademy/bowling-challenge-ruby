require 'score_card'
require 'frame'
require 'game'

describe Game do
  it "starts a new game by constructing a new game" do
    my_game = Game.new

    expect(my_game).to be_instance_of(Game)
  end
  it "generates a random number between 0 and 10" do
    my_game = Game.new
    
    expect(my_game.random_num).to be_instance_of(Integer)
  end
  it "adds an initial score of n to score_card.score if random_num is n" do
    my_game = Game.new
    my_score = ScoreCard.new
    random_num = my_game.random_num
    expect(my_score.total_score).to eq random_num
  end
end