require 'game'

RSpec.describe Game do
  it "Returns Total Score of 300 for perfect game" do
    game = Game.new([10,10,10,10,10,10,10,10,10,10,10,10])
    expect(game.calculate).to eq(300)
  end
  it "Calculates total score based on various values" do
    game = Game.new([10,3,4,4,5,6,3,10,2,7,5,1,3,4,2,1,7,1])
    expect(game.calculate).to eq(94)
  end
  it "Calculates the spare bonus" do
    game = Game.new([5,5,3,4,4,5,6,3,3,5,2,7,5,1,3,4,2,1,1,7])
    expect(game.calculate).to eq(79)
  end
  it "Calculates the spare bonus and strike bonus" do
    game = Game.new([5,5,3,4,10,6,3,3,5,2,7,5,1,3,4,2,1,1,7])
    expect(game.calculate).to eq(89)
  end
end
