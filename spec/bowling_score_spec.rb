require_relative '../lib/bowling_score'

describe 'BowlingScore' do

  before do
    @game = BowlingScore.new
  end

  it 'can roll all ones' do
    20.times{@game.play(1)}
    expect(@game.score).to eq 20
  end

  it 'can roll a spare' do
    @game.play 9
    @game.play 1
    @game.play 5
    17.times{@game.play(0)}
    expect(@game.score).to eq 20 
  end

  it 'can roll a strike' do
    @game.play 10
    @game.play 4
    @game.play 3
    16.times{@game.play 0}
    expect(@game.score).to eq 24 
  end

end


# As a user
# So I can keep track of my first roll
# I want to add to my scorecard
