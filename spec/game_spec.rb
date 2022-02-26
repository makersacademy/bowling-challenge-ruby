require 'game'

describe Game do
  let(:game) { described_class.new }
  # describe '#initialize' do
  #   it "has an entry for every possible roll of the 21 set to 0" do
  #     expect(game.scorecard.count).to eq 21
  #     expect(game.scorecard[0]).to eq 0
  #   end
  #   it "has a frame count set to 1" do
  #     expect(game.frame_counter).to eq 1
  #   end
  #   it "has a roll counter that starts at 1" do
  #     expect(game.roll_counter).to eq 1
  #   end
  #   it "has a frame counter that starts at 1" do
  #     expect(game.frame_counter).to eq 1
  #   end
  # end
  describe '#roll' do
  #   it "adds the score to the previous frame total if spare equals true" do
  #     game.roll(4)
  #     game.roll(6)
  #     expect{ game.roll(7) }.to change{ game.frames_total[0] }.by 7
  #   end
  #   it "adds the score to the bonus variable if strike equals true" do
  #     game.roll(10)
  #     game.roll(6)
  #     expect { game.roll(3) }.to change{ game.bonus }.by 9
  #   end
  #   it "ends the game at the 20th go if 10th frame is normal" do
  #     9.times{ game.roll(10) }
  #       game.roll(2)
  #       expect(game.roll(3)).to eq "Great game, you scored 260"
  #   end
  #   it "ends the game on the 21st go if tenth frame is spare" do
  #     9.times{ game.roll(10) }
  #     game.roll(2)
  #     game.roll(8)
  #     game.roll(5)
  #     expect(game.grand_total).to eq 280
  #   end
  #   it "ends game on 22nd go if tenth frame is a strike" do
  #     10.times{ game.roll(10) }
  #     game.roll(10)
  #     game.roll(10)
  #     expect(game.grand_total).to eq 300
  #   end
  #   it " returns 157 from the following game" do
  #     game.roll(10)
  #     game.roll(10)
  #     game.roll(10)
  #     game.roll(5)
  #     game.roll(3)
  #     game.roll(6)
  #     game.roll(4)
  #     game.roll(10)
  #     game.roll(3)
  #     game.roll(6)
  #     game.roll(10)
  #     game.roll(6)
  #     game.roll(3)
  #     expect(game.grand_total).to eq 157
  #   end
  end
end