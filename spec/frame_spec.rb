require 'frame'

describe Frame do
  describe '#initialize' do
    it 'creates new class instance with one argument' do
      expect(Frame.new(3)).to be_a(Frame)
      expect(Frame).to respond_to(:new).with(1).argument
      expect{Frame.new(3)}.to output("=== Frame 3 ===\n").to_stdout
    end

    it 'new class instance has expected instance variables' do
      expect(Frame.new(1).frame_number).to eq 1
      expect(Frame.new(1).score).to eq 0
      expect(Frame.new(1).bowl1).to eq nil
      expect(Frame.new(1).bowl2).to eq nil
      expect(Frame.new(1).bowl3).to eq nil
    end
  end

  describe '#enter_bowl' do
    it 'puts direction message and input of bowl returns that bowl' do
      allow_any_instance_of(Object).to receive(:gets).and_return('3')
      frame = Frame.new(1)
      expect{frame.enter_bowl(1)}.to output("Please enter the number of pins downed on your first bowl:\n").to_stdout
      expect(frame.bowl1).to eq(3)
      expect(frame.bowl2).to eq(nil)
      expect(frame.bowl3).to eq(nil)
      expect{frame.enter_bowl(2)}.to output("Please enter the number of pins downed on your second bowl:\n").to_stdout
      expect(frame.bowl2).to eq(3)
      expect{frame.enter_bowl(3)}.to output("Please enter the number of pins downed on your third bowl:\n").to_stdout
      expect(frame.bowl3).to eq(3)
    end

    it 'expect STRIKE and SPARE messages when boweled' do
      frame = Frame.new(1)

      allow_any_instance_of(Object).to receive(:gets).and_return('10')
      expect{frame.enter_bowl(1)}
      .to output(/STRIKE!!!\n/).to_stdout

      allow_any_instance_of(Object).to receive(:gets).and_return('5')
      frame.enter_bowl(1)
      expect{frame.enter_bowl(2)}
      .to output(/SPARE!!!\n/).to_stdout_from_any_process
    end

  end
end