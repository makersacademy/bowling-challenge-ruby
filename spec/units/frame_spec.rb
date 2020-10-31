describe Frame do
  let(:frame) { Frame.new }
  it "Can store two rolls are return their total" do
    frame.roll(3)
    frame.roll(4)
    expect(frame.pins).to eq 7
  end
end
