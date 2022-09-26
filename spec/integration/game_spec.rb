require 'frame'
require 'scorecard'
require 'game'

RSpec.describe Game do
  context "welcome message" do
    it "prints welcome message and asks for user input" do
      io = double :io
      scorecard = Scorecard.new
      game = Game.new(io, scorecard)
      expect(io).to receive(:puts).with ("Welcome")
      game.run
    end
  end
end
