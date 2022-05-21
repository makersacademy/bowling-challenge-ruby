require 'frame.rb'
require 'stringio'


describe Frame do
  let(:frame) { Frame.new(1) }

  describe '#run' do
    let(:input) { StringIO.new }

    it 'correctly records a strike' do
      input.puts '10'
      input.rewind
      $stdin = input
      frame.run
      expect(frame.strike?).to eq(true)
      expect(frame.spare?).to eq(false)
      expect(frame.total).to eq(10)
    end

    it 'correctly records a spare' do
      input.puts '5'
      input.puts '5'
      input.rewind
      $stdin = input
      frame.run
      expect(frame.strike?).to eq(false)
      expect(frame.spare?).to eq(true)
      expect(frame.total).to eq(10)
    end

    it 'correctly a not spare not strike score' do
      input.puts '4'
      input.puts '3'
      input.rewind
      $stdin = input
      frame.run
      expect(frame.strike?).to eq(false)
      expect(frame.spare?).to eq(false)
      expect(frame.total).to eq(7)
    end
  end
end