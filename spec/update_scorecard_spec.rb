require 'update_scorecard'
require 'player'

RSpec.describe UpdateScorecard do

        it "updates scorecard and prints total with no strikes or spares" do
        
        io = double :io
        # create new player
        player = Player.new(io, 'test')
        # get a score

        scorecard = UpdateScorecard.new(io, player)

        expect(io).to receive(:gets).and_return("1")
        expect(io).to receive(:gets).and_return("2")

        scorecard.getFrameScore

        expect(io).to receive(:gets).and_return("3")
        expect(io).to receive(:gets).and_return("4")

        scorecard.getFrameScore

        expect(player.calcTotal).to eq 10

    end

    it 'fails' do
        io = double :io

        player = Player.new(io, 'test')
        # get a score

        scorecard = UpdateScorecard.new(io, player)

        expect(io).to receive(:gets).and_return("11")

        expect { scorecard.getFrameScore }.to raise_error "must be under 10" # return error
    end

    it 'fails' do
        io = double :io

        player = Player.new(io, 'test')
        # get a score

        scorecard = UpdateScorecard.new(io, player)

        expect(io).to receive(:gets).and_return("1")
        expect(io).to receive(:gets).and_return("10")

        expect { scorecard.getFrameScore }.to raise_error "must be under 9" # return error
    end

    it 'fails' do
        io = double :io

        player = Player.new(io, 'test')
        # get a score

        scorecard = UpdateScorecard.new(io, player)

        expect(io).to receive(:gets).and_return("6")
        expect(io).to receive(:gets).and_return("6")

        expect { scorecard.getFrameScore }.to raise_error "total input this frame must be 10 or under" # return error
    end


end