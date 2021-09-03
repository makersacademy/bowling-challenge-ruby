describe Frame do 

  describe "#roll" do 

    it "returns a sum of two rolls" do 
      knocked_down_pins = [4,5]
      frame = Frame.new(knocked_down_pins)
      expect(frame.roll).to eq(9)
    end 


  end
end 