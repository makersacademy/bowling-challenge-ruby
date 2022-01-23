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
                                    [4, 3],
                                    [1, 5],
                                    [7, 2],
                                    [5, 4],
                                    [1, 3],
                                    [2, 6],
                                    [8, 1],
                                    [7, 1],
                                    [3, 2]
                                  ])
      expect(scoreboard.result).to eq 74
    end
    it 'calculate the score of a game includes spare and strike' do
      scoreboard = Scoreboard.new([
                                    [4, 3],	# frame 1 score = 7
                                    [10],	# frame 2 score = 20 (it is a strike)
                                    [8, 2],	 	# frame 3 score = 17 (it is spare)
                                    [7, 3],	 	# frame 4 score = 11 (it is spare)
                                    [1, 6],	 	# frame 5 score = 7
                                    [10],	# frame 6 score = 20 (it is strike)
                                    [6, 4],	 	# frame 7 score = 15 (it is spare)
                                    [5, 5],	 	# frame 8 score = 20 (it is spare)
                                    [10],	# frame 9 sore = 20 (it is strike)
                                    [4, 6, 8]	# frame 10 score = 18 ( it is spare, it is last frame, it has a roll as bonus)
                                    # total score = 155
                                  ])
      expect(scoreboard.result).to eq 155
    end
  end
end
