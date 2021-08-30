describe Player do 

  let(:player) { described_class.new("Graeme")}
  let(:test_score) { described_class.new("Graeme", [[2,3], [4,5], [6,1]])} 
  let(:spare_score) { described_class.new("Graeme", [[2,3], [4,6], [6,1]]) }
  let(:spares_score) { described_class.new("Graeme", [[2,3], [4,5], [6,4], [7,0], [8,2], [3,7], [3,4], [3,5], [6,2]]) }
  let(:strike_score) { described_class.new("Graeme", [[2,3], [10,0], [6,4], [10,0], [8,2], [3,5]]) }
  


  it "creates and instance of itself" do 
    expect(player).to be_an_instance_of(Player)
  end 

  it "stop player trying to do more than ten frames" do 
    10.times { player.frame }
    expect { player.frame }.to raise_error("Game is complete no frames remaining")
  end 
 
  it "calculates a the score of a bunch of frames with no spares or strikes" do
    expect(test_score.total).to eq(21)
  end 

  it "calculates a score with spares and no strikes" do
    expect(spare_score.total).to eq(28)
    expect(spares_score.total).to eq(87)
  end 

  it "calculates a score with spares and strikes separated" do 
    expect(strike_score.total).to eq(86)
  end 

end 


