describe Game do 

  let(:game) { described_class.new(["Jack", "Jill"]) }

  it "creates a new game with 2 players" do 
    expect(game.players.length).to eq(2) 
  end 

end 