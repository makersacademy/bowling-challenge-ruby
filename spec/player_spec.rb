require 'player'

RSpec.describe Player do

    it "puts the player's scorecard total" do
        io = double :io
        player = Player.new(io, 'test')
        player.addFrame([1, 2])
        player.calcTotal
        expect(io).to receive(:puts).with("Your total is 3")
        player.printTotal
    end

end
