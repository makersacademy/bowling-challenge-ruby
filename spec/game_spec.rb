describe Game do 

  let(:game) { described_class.new }

  it "creates and instance of itself" do 
    expect(game).to be_an_instance_of(Game)
  end 
end 