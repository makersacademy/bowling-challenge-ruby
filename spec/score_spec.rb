require_relative '../lib/score'
require_relative '../lib/frame'


context '#total_score' do 
  context 'a 4, 5 and 1, 4' do 
    it 'returns 15' do
      frame_1 = Frame.new(1)
      frame_1.first_roll = 4
      frame_1.second_roll = 5
      frame_2 = Frame.new(2)
      frame_2.first_roll = 1
      frame_2.second_roll = 4

      frames = [frame_1, frame_2]
      score = Score.new(frames)

      expect(score.total_score).to eq 14
    end 
  end 

  context ' 0,0 and 0,0' do 
    it 'returns 0' do 
      frame_1 = Frame.new(1)
      frame_1.first_roll = 0
      frame_1.second_roll = 0
      frame_2 = Frame.new(2)
      frame_2.first_roll = 0
      frame_2.second_roll = 0
      
      frames = [frame_1, frame_2]
      score = Score.new(frames)

      expect(score.total_score).to eq 0
    end 
  end 

  context 'a strike' do 
    it 'returns 36' do
      frame_1 = Frame.new(1)
      frame_1.first_roll = 10
      frame_2 = Frame.new(2)
      frame_2.first_roll = 2
      frame_2.second_roll = 6
      
      frames = [frame_1, frame_2]
      score = Score.new(frames)

      expect(score.total_score).to eq 26
    end 
  end 

  context 'a spare' do 
    it 'returns 21' do
      frame_1 = Frame.new(1)
      frame_1.first_roll = 3
      frame_1.second_roll = 7
      frame_2 = Frame.new(2)
      frame_2.first_roll = 3
      frame_2.second_roll = 5
      
      frames = [frame_1, frame_2]
      score = Score.new(frames)

      expect(score.total_score).to eq 21
    end 
  end
end 