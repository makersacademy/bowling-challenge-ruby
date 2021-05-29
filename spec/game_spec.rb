require 'game'

describe Game do
  describe '#bowl' do
    context 'when given 4' do
      it 'returns 4' do
        expect(subject.bowl(4)).to eq(4)
      end
    end

    context 'when given 4 then 2' do
      it 'returns 6' do
        subject.bowl(4)
        expect(subject.bowl(2)).to eq(6)
      end
    end
  end
end
