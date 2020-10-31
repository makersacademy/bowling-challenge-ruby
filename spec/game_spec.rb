require 'game'

describe Game do
  let(:game) { described_class.new }
 describe "#record_roll" do
   it "records the score of a single roll" do
     game.record_roll(5)
     expect(game.current_frame.sum).to eq(5)
   end
 end
end
