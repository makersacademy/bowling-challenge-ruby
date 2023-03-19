require 'frame'

RSpec.describe Frame do
  context 'player plays a frame and' do
    it 'rolls two gutter balls' do
      player = double :player, name: 'Josh'
      frame = Frame.new(player)
      expect(player).to receive(:roll).and_return 0
      frame.roll_one(player.roll(0))
      expect(player).to receive(:roll).and_return 0
      frame.roll_two(player.roll(0))

      result = frame.end_frame
    
      expect(result[:roll_one]).to eq 0
      expect(result[:special]).to eq 'none'
      expect(result[:roll_two]).to eq 0
      expect(result[:score]).to eq 0
    end

    it 'knocks down 1 pin on roll one, 0 on roll two' do
      player = double :player, name: 'Josh'
      frame = Frame.new(player)
      expect(player).to receive(:roll).and_return 1
      frame.roll_one(player.roll(1))
      expect(player).to receive(:roll).and_return 0
      frame.roll_two(player.roll(0))
      
      result = frame.end_frame

      expect(result[:roll_one]).to eq 1
      expect(result[:special]).to eq 'none'
      expect(result[:roll_two]).to eq 0
      expect(result[:score]).to eq 1
    end 

    it 'knocks down 3 pins on roll one, 4 on roll two' do
      player = double :player, name: 'Josh'
      frame = Frame.new(player)
      expect(player).to receive(:roll).and_return 3
      frame.roll_one(player.roll(3))
      expect(player).to receive(:roll).and_return 4
      frame.roll_two(player.roll(4))
      
      result = frame.end_frame

      expect(result[:roll_one]).to eq 3
      expect(result[:special]).to eq 'none'
      expect(result[:roll_two]).to eq 4
      expect(result[:score]).to eq 7
    end

    it 'rolls a strike' do
      player = double :player, name: 'Josh'
      frame = Frame.new(player)
      expect(player).to receive(:roll).and_return 10
      frame.roll_one(player.roll(10))
      
      result = frame.end_frame

      expect(result[:roll_one]).to eq 'X'
      expect(result[:special]).to eq 'STRIKE'
      expect(result[:roll_two]).to eq 0
      expect(result[:score]).to eq 10
    end

    it 'rolls a spare' do
      player = double :player, name: 'Josh'
      frame = Frame.new(player)
      expect(player).to receive(:roll).and_return 8
      frame.roll_one(player.roll(8))
      expect(player).to receive(:roll).and_return 2
      frame.roll_two(player.roll(2))
      
      result = frame.end_frame

      expect(result[:roll_one]).to eq 8
      expect(result[:special]).to eq 'SPARE'
      expect(result[:roll_two]).to eq '/'
      expect(result[:score]).to eq 10
    end
  end
end