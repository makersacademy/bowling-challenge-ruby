describe Frame do 

  it "Knows if knocked down pins is a spare or not" do 
    expect(Frame.new([4,6]).spare).to eq(true)
    expect(Frame.new([4,5]).spare).to eq(nil)
  end 

  it "Knows if knocked down pins is a strike or not" do 
    expect(Frame.new([10,0]).strike).to eq(true)
    expect(Frame.new([7,2]).strike).to eq(nil)
  end 

end 
