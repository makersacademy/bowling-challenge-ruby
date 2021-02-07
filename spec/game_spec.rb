# require 'game'
#
# describe Game do
#   subject(:game) { described_class.play }
#
#   describe '.play' do
#     it "should allow game to respond to play" do
#     expect(Game.play).to be_a(Game)
#     end
#   end
#
#   describe '#bowl' do
#     it "should allow the user to input the score" do
#       expect(game).to respond_to(:bowl).with(2).argument
#     end
#
#     it "should return the total score" do
#       game.bowl(7, 2)
#       expect(game.total_score).to eq(9)
#     end
#   end
#
#   describe "#completed?" do
#     it "raises an error if player tries to input a bowl after 10th frame is completed" do
#       allow(game.bowl_history).to receive(:length).and_return(10)
#       expect{ game.bowl(1,2) }.to raise_error("STOP. No more fun.")
#     end
#   end
#
#   describe "#spare" do
#     it "should double the next bowls score" do
#       game.bowl(6,4)
#       game.bowl(3,4)
#       expect(game.total_score).to eq(24)
#     end
#
#   end
#
#   # describe "#spare" do
#   #
#   # end
#
# end
