require 'frame.rb'

describe Frame do
	it 'has a separate score' do
		expect(subject).to respond_to(:score)
	end

	it 'registers number of pins knocked down after a roll' do
		expect { subject.roll }.to change { subject.score }
	end

	it 'has two separate rolls' do
		expect(subject).to respond_to(:first_roll)
		expect(subject).to respond_to(:second_roll)
	end

	it 'ends if first roll is a strike' do
		double = Frame.new
		allow(double).to receive(:first_roll).and_return(10)

		expect(subject.score.length).to eq(1) 
	end
end
