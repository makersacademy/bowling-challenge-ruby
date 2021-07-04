require 'frame'

RSpec.describe Frame do
	it 'has an id' do
		frame = Frame.new(1, 2, 3)

		expect(frame.id).to eq(1)
	end

	it 'can store how many pins were knocked down in both rolls' do
		frame = Frame.new(1, 2, 3)

		expect(frame.roll_1).to eq(2)
		expect(frame.roll_2).to eq(3)
	end

	it 'can return the total points so far' do
		frame = Frame.new(1, 2, 3)

		expect(frame.total_points).to eq(5)
	end

	it 'can tell if a spare was made' do
		frame = Frame.new(1, 2, 8)

		expect(frame.spare).to be_truthy
	end

	it 'can tell if a strike was made' do
		frame = Frame.new(1, 10)

		expect(frame.strike).to be_truthy
	end

	it 'can add extra points to the total' do
		frame = Frame.new(1, 10)

		expect(frame.points).to eq(10)

		frame.additional_points(2, 5)

		expect(frame.total_points).to eq(17)
	end
	
end
