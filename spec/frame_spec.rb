require 'frame'

RSpec.describe Frame do
  context 'player plays a frame and' do
    it 'rolls two gutter balls' do
        player = double :player
        frame = Frame.new(player)
        result = frame.play(0, 0)

        expect(result[:roll_one]).to eq 0
        expect(result[:special]).to eq 'none'
        expect(result[:roll_two]).to eq 0
        expect(result[:score]).to eq 0
    end

    it 'knocks down 1 pin on roll one, 0 on roll two' do
      player = double :player
      frame = Frame.new(player)
      result = frame.play(1, 0)

      expect(result[:roll_one]).to eq 1
      expect(result[:special]).to eq 'none'
      expect(result[:roll_two]).to eq 0
      expect(result[:score]).to eq 1
    end 

    it 'knocks down 3 pins on roll one, 4 on roll two' do
      player = double :player
      frame = Frame.new(player)
      result = frame.play(3, 4)

      expect(result[:roll_one]).to eq 3
      expect(result[:special]).to eq 'none'
      expect(result[:roll_two]).to eq 4
      expect(result[:score]).to eq 7
    end

    it 'rolls a strike' do
      player = double :player
      frame = Frame.new(player)
      result = frame.play(10, nil)

      expect(result[:roll_one]).to eq 'X'
      expect(result[:special]).to eq 'STRIKE'
      expect(result[:roll_two]).to eq 0
      expect(result[:score]).to eq 10
    end

    it 'rolls a spare' do
      player = double :player
      frame = Frame.new(player)
      result = frame.play(8, 2)

      expect(result[:roll_one]).to eq 8
      expect(result[:special]).to eq 'SPARE'
      expect(result[:roll_two]).to eq '/'
      expect(result[:score]).to eq 10
    end
  end
end