describe Player do 

  # helper methods that contain scores for testing ########################################
  let(:player) { described_class.new("Graeme")}
  # score with no spares or strikes
  let(:test_score) { described_class.new("Graeme", {1 => [2, 3], 2 => [4, 5], 3 => [6, 1]})} 
  # score with single spare
  let(:spare_score) { described_class.new("Graeme", {1 => [2, 3], 2 => [4, 6], 3 => [6, 1]}) }
  # # score with spares an no strikes 
  let(:spares_score) { described_class.new("Graeme", {1 => [2, 3], 2 => [4, 5], 3 => [6, 4], 
  4 =>[7, 0], 5 => [8, 2], 6 => [3, 7], 7 => [3, 4], 8 => [3, 5], 9 => [6, 2]}) }
  # score with two strikes and some spares
  let(:strike_score) { described_class.new("Graeme", {1 => [2, 3], 2 => [10, 0], 3 => [6, 4], 
  4 => [10, 0], 5 => [8, 2], 6 => [3, 5]}) }
  # score that includes a double 
  let(:double_score) { described_class.new("Graeme", { 1 => [7, 0], 2 => [10, 0], 3 => [10, 0],
  4 => [5, 0]}) }
  # score that includes a turkey 
  let(:turkey_score) { described_class.new("Graeme", [[7, 0], [10, 0], [10, 0], [10, 0], [3, 2]]) }
  #####################################
  
  it "creates and instance of itself" do 
    expect(player).to be_an_instance_of(Player)
  end 

  it "calculates a the score with no spares or strikes" do
    expect(test_score.total).to eq(21)
  end 

  it "calculates a score with spares" do
    expect(spare_score.total).to eq(28)
    expect(spares_score.total).to eq(87)
  end 

  it "calculates a score with spares and single streak strikes" do 
    expect(strike_score.total).to eq(86)
  end 

  it "calculates correst score when players scores a double" do 
    expect(double_score.total).to eq(52)
  end 

  # it "calculates correst score when players scores a turkey" do 
  #   expect(turkey_score.total).to eq(82)
  # end
end 

  # unused test
  # it "stop player trying to do more than ten frames" do 
  #   10.times { player.frame }
  #   expect { player.frame }.to raise_error("Game is complete no frames remaining")
  # end 