require 'game'

describe Game do
  describe '#bowl' do
    context 'when given 4' do
      it 'returns 4' do
        expect(subject.bowl(4)).to eq(4)
      end
    end
  end
end
