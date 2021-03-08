# frozen_string_literal: true

require 'runfile'

describe 'feature test' do
  it 'user can score their game of bowling' do
    game = Game.new
    game.add_bowl(pins: 4)
    game.add_bowl(pins: 6)
    game.add_bowl(pins: 8)
    game.add_bowl(pins: 1)
    game.add_bowl(pins: 4)
    game.add_bowl(pins: 5)
    game.add_bowl(pins: 10)
    game.add_bowl(pins: 10)
    game.add_bowl(pins: 3)
    game.add_bowl(pins: 5)
    game.add_bowl(pins: 6)
    game.add_bowl(pins: 4)
    game.add_bowl(pins: 7)
    game.add_bowl(pins: 1)
    game.add_bowl(pins: 0)
    game.add_bowl(pins: 0)
    game.add_bowl(pins: 7)
    game.add_bowl(pins: 3)
    game.add_bowl(pins: 5)
    expect { game.display.show }.to output { "| 01 | 02 | 03 | 04 | 05 | 06 | 07 | 08 | 09 |  10 |\n|4/   | 81 | 45 | X  | X  | 35 | 6/ | 71 | 00 | 7/5 |\n|030 |060 |090 |120 |150 |180 |210 |240 |270 |300" }.to_stdout
  end
end
