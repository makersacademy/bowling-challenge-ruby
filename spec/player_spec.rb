describe Player do 

  let(:player) { described_class.new }

  it "creates and instance of itself" do 
    expect(player).to be_an_instance_of(Player)
  end 
end 