# frozen_string_literal: true

require_relative '../app'
require_relative '../lib/bowling_score_sheet'

RSpec.describe BowlingApp do
  it 'calculates the running score of a game with no strikes or spares' do
    io = double :io
    game = BowlingApp.new(io, BowlingScoreSheet.new)
    game.roll('1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1')
    expect(game.score).to eq 20

    game = BowlingApp.new(io, BowlingScoreSheet.new)
    game.roll('2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2')
    expect(game.score).to eq 40

    game = BowlingApp.new(io, BowlingScoreSheet.new)
    game.roll('2,2,2,2,2,2,2,2,2,2')
    game.roll('2,2,2,2,2,2,2,2,2,2')
    expect(game.score).to eq 40
  end

  it 'calculates the running score of a game with one spare (not in final frame)' do
    io = double :io
    game = BowlingApp.new(io, BowlingScoreSheet.new)
    game.roll('1,1,2,8,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1')
    expect(game.score).to eq 29
  end

  it 'calculates the running score of a game with a mix of spares and stikes' do
    io = double :io
    BowlingScoreSheet.new

    game = BowlingApp.new(io, BowlingScoreSheet.new)
    game.roll('1,1,1,1,1,1,1,1,1,1,10,10,2,8,8,2,10,4,5')
    expect(game.score).to eq 109
  end
end
