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
    it 'should have result attribute' do
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
      expect(scoreboard).to have_attributes(result: 0)
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
  describe '#calculate_score' do
    it 'should calculate_score' do
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
      expect(scoreboard).to respond_to(:calculate_score)
    end

		it 'calculate the numbers of pin when there is not any strikes and spares' do 
			scoreboard = Scoreboard.new([
				[3, 6],
				[4, 6],
				[1, 5],
				[7, 2],
				[5, 4],
				[1, 3],
				[2, 6],
				[8, 1],
				[7, 1],
				[3, 2]
			])
			expect(scoreboard.result).to eq 77
		end

  end
end
