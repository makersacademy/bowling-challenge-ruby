# frozen_string_literal: true

require 'scoreboard'
describe Scoreboard do
  describe '#initialize' do
    it 'initialize an instance of Scoreboard' do
      scoreboard = Scoreboard.new([
                                    [0, 0],
                                    [0, 0],
                                    [0, 0],
                                    [0, 0],
                                    [0, 0],
                                    [0, 0],
                                    [0, 0],
                                    [0, 0],
                                    [0, 0],
                                    [0, 0]
                                  ])
      expect(scoreboard).to be_a Scoreboard
    end
  end

  describe '.result' do
    it 'returns lowest score of game as 0' do
      scoreboard = Scoreboard.new([
                                    [0, 0],
                                    [0, 0],
                                    [0, 0],
                                    [0, 0],
                                    [0, 0],
                                    [0, 0],
                                    [0, 0],
                                    [0, 0],
                                    [0, 0],
                                    [0, 0]
                                  ])
      expect(scoreboard.result).to eq 0
    end
    it 'returns maximum score of game as 300' do
      scoreboard = Scoreboard.new([
                                    [10],
                                    [10],
                                    [10],
                                    [10],
                                    [10],
                                    [10],
                                    [10],
                                    [10],
                                    [10],
                                    [10, 10, 10]
                                  ])
      expect(scoreboard.result).to eq 300
    end
  end
end
