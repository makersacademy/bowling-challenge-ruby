describe Player do 

  let(:player) { described_class.new("Graeme") }

  it "creates and instance of itself" do 
    expect(player).to be_an_instance_of(Player)
  end 

  it "stop player trying to do more than ten frames" do 
    10.times { player.frame }
    expect { player.frame }.to raise_error("Game is complete no frames remaining")
  end 
 
end 


