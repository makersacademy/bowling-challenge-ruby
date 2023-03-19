require './lib/player'
require './lib/players'

RSpec.describe Players do
  it 'Creates and returns the name of that player.' do
    players = Players.new
    player1 = Player.new
    players.add_player(player1.create_player('Paul','Lazar'))
    expect(players.show_players_list).to eq ['Paul Lazar']
  end

  it 'Creates max no. of players and returns a list with all names.' do
    players = Players.new
    player1 = Player.new
    players.add_player(player1.create_player('Paul','Lazar'))

    player2 = Player.new
    players.add_player(player2.create_player('Alice','Jones'))

    player3 = Player.new
    players.add_player(player3.create_player('Frank','Sinatra'))

    player4 = Player.new
    players.add_player(player4.create_player('Paul','Mcarthy'))

    player5 = Player.new
    players.add_player(player5.create_player('Franz','Liszt'))
    list = players.show_players_list
    expect(list).to eq ['Paul Lazar','Alice Jones','Frank Sinatra','Paul Mcarthy','Franz Liszt']
  end
end
