require 'game'

describe Game do
  describe '#bowl' do
    context 'when less than 10 pins are knocked down in a single frame' do
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

    context 'when a strike occurs' do
      context 'when given 10' do
        it 'returns 10' do
          expect(subject.bowl(10)).to eq(10)
        end
      end

      context 'when given 10 then 3' do
        it 'returns 16' do
          subject.bowl(10)
          expect(subject.bowl(3)).to eq(16)
        end
      end

      context 'when given 10 then 3 then 6' do
        it 'returns 28' do
          subject.bowl(10)
          subject.bowl(3)
          expect(subject.bowl(6)).to eq(28)
        end
      end

      context 'when given 10 then 3 then 6 then 4' do
        it 'returns 32' do
          subject.bowl(10)
          subject.bowl(3)
          subject.bowl(6)
          expect(subject.bowl(4)).to eq(32)
        end
      end
    end

    context 'when a spare occurs' do
      context 'when given 7' do
        it 'returns 7' do
          expect(subject.bowl(7)).to eq(7)
        end
      end

      context 'when given 7 then 3' do
        it 'returns 10' do
          subject.bowl(7)
          expect(subject.bowl(3)).to eq(10)
        end
      end

      context 'when given 7 then 3 then 4' do
        it 'returns 18' do
          subject.bowl(7)
          subject.bowl(3)
          expect(subject.bowl(4)).to eq(18)
        end
      end

      context 'when given 7 then 3 then 4 then 2' do
        it 'returns 20' do
          subject.bowl(7)
          subject.bowl(3)
          subject.bowl(4)
          expect(subject.bowl(2)).to eq(20)
        end
      end
    end
  end
end
