
# As a player
# So I know this is my scorecard
# I would like to see my name before entering scores

describe 'starting the game' do
  context 'when name argument given' do
    it 'outputs the name' do
      expect { system('ruby bin/scorecard Rob') }.to output(a_string_including('Player: Rob')).to_stdout_from_any_process
    end
  end
  context 'when no argument given' do
    it 'does not output a name' do
      expect { system('ruby bin/scorecard') }.to_not output(a_string_including('Player:')).to_stdout_from_any_process
    end
  end
end