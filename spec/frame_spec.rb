require 'frame' 

describe Frame do

    describe '#roll' do
			it 'should change the number of pins' do
				expect{ subject.roll(5) }.to change{ subject.pin_count }.by(-5)
			end

			it 'should record each roll' do
				expect{ subject.roll(3) }.to change{ subject.record_roll.sum }.by(3)
			end

			it 'should not allow another roll after a strike' do
				subject.roll(10)
				expect(subject.record_roll.count).to eq 2
				expect{ subject.roll(3) }.not_to change{ subject.record_roll.sum }
			end
    end
end