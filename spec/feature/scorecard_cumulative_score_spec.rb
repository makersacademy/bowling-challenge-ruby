describe "after inputting score for each roll" do
  it "returns cumulative score for each frame" do
    Scorecard.create
    expect(Scorecard).to respond_to(:score).with(1).arguments
    expect(Scorecard.score([1,4,4,5,6,4,5,5,10,0,1,7,3,6,4,10,2,8,6])).to eq [5,14,29,49,60,61,77,97,117,133]
  end
end