# frozen_string_literal: true

require_relative '../lib/bowling_game'

describe Bowlinggame do
  describe 'bowling game behavior' do
    it 'can roll a gutter game' do
      game = Bowlinggame.new
      20.times { game.roll 0 }
      expect(subject.score).to eq 0
    end

    it 'can roll a score of 1' do
      game = Bowlinggame.new
      20.times { game.roll 1 }
      expect(game.score).to eq 20
    end

    it 'can roll a spare' do
      game = Bowlinggame.new
      game.roll 5
      game.roll 5
      game.roll 3
      17.times { game.roll 0 }
      expect(game.score).to eq 16
    end
  end
  # now to create a spare method
  # do this by creating a new game
  # then how many rolls
  # expect the score to equal

  # then next a score
  # This will be a new instance of the class whichh will equal 0
  # Then, if test uis correct think about getting the score set up etc.
end
