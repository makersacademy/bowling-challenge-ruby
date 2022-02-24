require 'bowling_game'

RSpec.describe BowlingGame do
let(:frame_1) {double(id: 1, roll_1: 10, roll_2: 0, spare?: false, strike?: true, points: 10)}
let(:frame_2) {double(id: 2, roll_1: 5, roll_2: 4, spare?: false, strike?: false, points: 9)}
let(:frame_3) {double(id: 10, roll_1: 5, roll_2: 5, spare?: true, strike?: false, points: 10)}

  context 'storing frames' do
		it 'can store one frame' do
			subject.add(frame_1)
	
			expect(subject.frames[0]).to eq(frame_1)
		end
	
		it 'can store multiple frames' do
			subject.add(frame_1)
			expect(subject.frames.length).to eq(1)
	
			subject.add(frame_2)
			expect(subject.frames.length).to eq(2)
		end
	end

	context 'adding points' do
		it 'can add the points of one frame to the total' do
			subject.add(frame_1)

			expect(subject.total).to eq(10)
		end

		context 'extra points' do
			it 'can add points from the next two rolls when a strike is made' do
				subject.add(Frame.new(1, 10))
				subject.add(Frame.new(2, 5, 4))
				expect(subject.total).to eq(28)
			end

			it 'can add points from the next roll when a spare is made' do
				subject.add(Frame.new(1, 5, 5))
				subject.add(Frame.new(2, 5, 4))
				expect(subject.total).to eq(24)
			end

			it 'can add the first roll of the third frame when the first two are strikes' do
				subject.add(Frame.new(1, 10))
				subject.add(Frame.new(2, 10))
				subject.add(Frame.new(3, 5, 3))

				expect(subject.total).to eq(51)
			end
		end
	end
end
