require 'update_scorecard'
require 'player'

RSpec.describe UpdateScorecard do
    it "updates scorecard and prints total with no strikes or spares" do
    # create new player
    player = Player.new('test')
    # get a score
    io = double :io
    scorecard = UpdateScorecard.new(io, player)

    expect(io).to receive(:gets).and_return("1")
    expect(io).to receive(:gets).and_return("2")

    scorecard.getFrameScore

    expect(io).to receive(:gets).and_return("3")
    expect(io).to receive(:gets).and_return("4")

    scorecard.getFrameScore

    expect(player.calcTotal).to eq 10
    end
end