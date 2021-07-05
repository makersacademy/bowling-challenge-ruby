require 'frame'

RSpec.describe Frame do

	context '.initialize methods' do
		it 'has an id' do
			frame = Frame.new(1, 2, 3)
	
			expect(frame.id).to eq(1)
		end

		it 'can store how many pins were knocked down in both rolls' do
			frame = Frame.new(1, 2, 3)
	
			expect(frame.roll_1).to eq(2)
			expect(frame.roll_2).to eq(3)
		end
	end
	
	context '.adding points' do
		it 'can return the total points so far' do
			frame = Frame.new(1, 2, 3)
	
			expect(frame.points).to eq(5)
		end
	end

	context '.spares vs .strikes' do
		it 'can tell if a spare was made' do
			frame = Frame.new(1, 2, 8)
	
			expect(frame.spare?).to be_truthy
		end
	
		it 'can tell if a strike was made' do
			frame = Frame.new(1, 10)
	
			expect(frame.strike?).to be_truthy
		end

		it 'can differenciate a spare from a strike' do
			frame = Frame.new(1, 0, 10)

			expect(frame.strike?).to be_falsy
			expect(frame.spare?).to be_truthy
		end
	end

	context '10th frame' do
		it ' can give an additional shot, if a spare was made' do
			frame = Frame.new(10, 5, 5, 4)

			expect(frame.rolling?).to be_truthy

			expect(frame.points).to eq(14)
		end
	end
end
