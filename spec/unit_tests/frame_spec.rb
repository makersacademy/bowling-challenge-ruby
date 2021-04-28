describe Frame do

  it "returns the correct total of 2 rolls" do
    subject = Frame.new(roll_1: 5, roll_2: 2)
    expect(subject.total).to eq(7)
  end
    
end
