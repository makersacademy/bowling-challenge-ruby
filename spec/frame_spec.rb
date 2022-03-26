require 'frame'

describe Frame do
  subject(:frame) { described_class.new(1) }

  it 'stores which number frame it is' do
    expect(frame.number).to eq 1
  end

  it 'starts with an empty array of scores' do
    expect(frame.scores).to be_empty
  end

  describe '#complete?' do
    context 'if two scores have been added' do
      before do
        frame.add(1)
        frame.add(1)
      end
      it 'returns true' do
        expect(frame.complete?).to be true
      end
    end
  end
end
