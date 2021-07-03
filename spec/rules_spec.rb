require 'rules'

  describe Rules do


  let(:rules) { double :rules }
    it 'default number of frames set to 10' do
      expect(subject.frames).to eq Rules::MAXIMUM_FRAMES
    end

    it 'defaults the number of pins to 10' do
      expect(subject.pins).to eq Rules::MAXIMUM_PINS
    end

    it 'strike is set as 10 pins being hit' do
      expect(subject.strike(10)).to eq true
    end

    it 'spare is set at 10 pins being hit in total across two turns' do
      expect(subject.spare(5, 5)).to eq true
    end
  end