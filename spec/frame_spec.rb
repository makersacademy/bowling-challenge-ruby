describe Frame do

  let(:frame) { described_class.new(id: 1) }

  describe '#strike' do
    it 'is called on an instance of the Frame class' do
      expect(frame).to respond_to(:strike)
    end

    it 'adds 10 points to the frame\'s score' do
      expect{ frame.strike }.to change { frame.scores[:first_roll] }.by(10)
    end

    it 'causes termination of the current frame' do
      expect { frame.strike }.to change { frame.state }.from(false).to(true)
    end
  end

end