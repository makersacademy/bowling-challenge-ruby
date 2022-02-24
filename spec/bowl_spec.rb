require 'bowl'

describe Bowl do
  let(:bowl) {described_class.new}

  it 'should have roll one equal to five' do
    bowl.first_roll(5)
    expect(bowl.rolls[0][:roll_one]).to eq 5
  end

  it 'should have second roll equal to 3' do
    bowl.first_roll(5)
    bowl.second_roll(3)
    expect(bowl.rolls[0][:roll_two]).to eq 3

  end

  it 'should be able to accuratey calculate total roll' do
    bowl.first_roll(5)
    bowl.second_roll(3)
    expect(bowl.rolls[0][:total_roll]).to eq 8
    
  end

  it 'should be able to accuratey calculate total roll for second frame' do
    bowl.first_roll(5)
    bowl.second_roll(3)
    bowl.first_roll(5)
    bowl.second_roll(1)
    expect(bowl.rolls[1][:total_roll]).to eq 6
    
  end

  it 'should be able to calculate strike' do
    bowl.first_roll(10)
    bowl.first_roll(5)
    bowl.second_roll(3)
    expect(bowl.rolls[0][:total_roll]).to eq 18
    
  end

  it 'should be able to calculate total roll for second frame once a strike is done' do
    bowl.first_roll(10)
    bowl.first_roll(5)
    bowl.second_roll(3)
    expect(bowl.rolls[1][:total_roll]).to eq 8
    
  end

  it 'can accurately calculate spare' do
    bowl.first_roll(5)
    bowl.second_roll(5)
    bowl.first_roll(3)
    expect(bowl.rolls[0][:total_roll]).to eq 13

  end

  it 'can accurately calculate spare' do
    bowl.first_roll(5)
    bowl.second_roll(5)
    bowl.first_roll(3)
    bowl.second_roll(3)
    expect(bowl.rolls[1][:total_roll]).to eq 6

    
  end

end