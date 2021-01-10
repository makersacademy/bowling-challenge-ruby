# As a user
#So that I can go bowling
#I need to input a score 

require 'bowling.rb'

describe BowlingGame do

  let(:game) { BowlingGame.new }

  context 'gutter game' do
    it do
      roll_many 20, 0
      expect(game.score).to eq 0
    end
  end

  context 'all ones' do 
    it do 
      roll_many 20, 1
      expect(game.score).to eq 20
    end
  end

  def roll_many(n, pins)
    n.times { game.roll(pins)}
  end
end

