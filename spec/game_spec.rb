require './lib/game'

describe Game do

  it "creates a game with a given number of players" do
    subject.start(4)
    expect(subject.players.length).to eq(4)
  end

end
