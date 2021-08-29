require './lib/game.rb'

describe Game do 

  let(:player){ double :player, 
                name: 'Radu'
              }
  let(:player_4_left){ double :player, 
                name: 'Jake',
                pins_rest: 4
              }
  let(:player_end){ double :player, 
                name: 'Jake', 
                pins_rest: 4,
                frame: 10, 
                roll: 2, 
                score: 200, 
                count_next: 0
              }
  let(:player_extra){ double :player,
                count_next: 1
              }

  let(:subject){ described_class.new(player.name) }
  let(:subject_4_left){ described_class.new(player_4_left.name, player_4_left.pins_rest) }
  let(:subject_game_has_ended){ described_class.new(player_end.name, player_end.pins_rest, player_end.frame, player_end.roll, player_end.score, player_end.count_next) }
  let(:subject_game_has_extra_roll){ described_class.new(player_end.name, player_end.pins_rest, player_end.frame, player_end.roll, player_end.score, player_extra.count_next) }

  let(:list){ ['player', 'frame', 'roll', 'score', 'count_next'] }

  it 'expects the instantiated class should hold these state instance variables' do
    list.each do |state|
      expect(subject).to respond_to(state)
    end
  end

  it 'expected to respond to method register_pins with 1 argument and return true' do 
    expect(subject).to respond_to(:register_pins).with(1).argument
  end

  it 'expects register_pins to raise error if argument(dropped pins number) passed is non digit' do 
    expect{ subject.register_pins('a') }.to raise_error('pins registration failed, not a number')
  end

  it 'expects register_pins to raise error if argument(dropped pins number) is smaller than 0 ' do
    expect{ subject.register_pins(-1) }.to raise_error('pins registration failed, number smaller than 0')
  end

  it 'expects register_pins to raise error if argument(dropped pins number) is greater than 10 ' do
    expect{ subject.register_pins(11) }.to raise_error('pins registration failed, number greater than 10')
  end

  it 'expects register_pins to raise error if argument(dropped pins number) is greater than pins_rest(left standing) ' do
    expect{ subject_4_left.register_pins(5) }.to raise_error('pins registration failed, number greater than rest of pins')
  end
  
  it 'expects register_pins to raise error if game has ended ' do
    expect{ subject_game_has_ended.register_pins(3) }.to raise_error('pins registration failed, game has ended')
  end

  it 'expects register_pins to register pins having an extra round' do
    expect(subject_game_has_extra_roll.register_pins(3)).to eq('extra roll')
  end

end
