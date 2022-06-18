describe Frame do
  subject(:frame) { Frame.new }
  context "initially" do
    it "strike should be false" do
      expect(frame.is_strike).to eq false
    end

    it "spare should be false" do
      expect(frame.is_spare).to eq false
    end

    it "should show 0 for number of spares" do
      expect(frame.num_spares).to eq 0
    end
  end
end
