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
end
