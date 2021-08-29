describe Game do 

  let(:game) { described_class.new(2) }
  let(:player_one) { Player.new("Jack") }
  let(:player_two) { Player.new("Jill") }

  it "creates a new game with 2 players" do 
    expect(game.num_players).to eq(2) 
  end 

 
end 