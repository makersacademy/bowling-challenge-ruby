require 'points'

describe Points do
  let(:points) { Points.new }

  describe '#initialize' do
    it 'sets up instance variables for the total score summation and a score breakdown per frame' do
      expect(points.total).to eq 0
      expect(points.frames).to be_an Array
      expect(points.frames.length).to eq 10
      expect(points.frames.first).to be_a Hash
      expect(points.frames.first).to include(:roll_1 => 0, :roll_2 => 0, :bonus => [])
    end
  end
end