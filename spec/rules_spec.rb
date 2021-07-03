require 'rules'

  describe Rules do


  let(:rules) { double :rules }
    it 'default number of frames set to 10' do
      expect(subject.frames).to eq Rules::MAXIMUM_FRAMES
    end

    it 'defaults the number of pins to 10' do
      expect(subject.pins).to eq Rules::MAXIMUM_PINS
  end
end