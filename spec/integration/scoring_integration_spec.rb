require 'bowling_game'
require 'bowling_scorecard'

RSpec.describe 'scoring integration' do

  let(:game) { BowlingGame.new }

  context 'a regular bowling game' do
    # initial rolls
    before(:each) do
      game.roll(3)
      game.roll(4)
      game.roll(1)
      game.roll(7)
      game.roll(0)
      game.roll(3)
      game.roll(2)
      game.roll(6)
    end

    it 'calculates the score of a regular bowling game with no strikes or spares' do
      game.roll(8)
      game.roll(0)
      game.roll(1)
      game.roll(0)
      game.roll(0)
      game.roll(0)
      game.roll(1)
      game.roll(5)
      game.roll(7)
      game.roll(2)
      game.roll(4)
      game.roll(1)
      
      expect(game.total_score).to eq 55
    end
    
    it 'calculates the score of a game with a couple spares' do
      # first spare
      game.roll(1)
      game.roll(9)
      # next roll doubled
      game.roll(1)
      game.roll(0)
      game.roll(0)
      game.roll(0)
      # second spare
      game.roll(1)
      game.roll(9)
      # next roll doubled
      game.roll(7)
      game.roll(2)
      game.roll(4)
      game.roll(1)
      
      expect(game.total_score).to eq 69
    end

    it 'calculates the score of a game with a couple strikes' do
      # first strike
      game.roll(10)
      # next two rolls doubled
      game.roll(1)
      game.roll(0)
      game.roll(0)
      game.roll(0)
      # second strike
      game.roll(10)
      # next two rolls doubled
      game.roll(7)
      game.roll(2)
      game.roll(4)
      game.roll(1)
      
      expect(game.total_score).to eq 71
    end

    it 'calculates the score of a game with a mix of spares and strikes' do
      # spare
      game.roll(1)
      game.roll(9)
      # strike
      game.roll(10)
      game.roll(0)
      game.roll(0)
      # strike
      game.roll(10)
      # spare
      game.roll(7)
      game.roll(3)
      game.roll(4)
      game.roll(1)

      expect(game.total_score).to eq 95
    end
  end

  context 'end game strikes/spares' do
    before(:each) do
      18.times do
        game.roll(0)
      end
    end

    xit 'correctly scores an end game strike' do
      game.roll(10)
      game.roll(4)
      game.roll(3)

      expect(game.total_score).to eq 17
    end

    xit 'correctly scores an end game spare' do
      game.roll(9)
      game.roll(1)
      game.roll(4)

      expect(game.total_score).to eq 14     
    end
  end

  context 'a perfect game' do
    xit 'correctly scores a perfect game' do
      12.times do
        game.roll(10)
      end
      
      expect(game.total_score).to eq 300
    end
  end
end
