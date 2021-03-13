require './lib/game'
require 'sinatra/base'
require 'json'

class Bowling_scores_app < Sinatra::Base
  enable :sessions

  get '/' do 
    game = Game.instance(player_1_name:'player_1', player_2_name:'player_2')
    {player_1_name: game.player_1.name,
    player_1_score: game.player_1.score,
    player_1_bonus: game.player_1.bonus,
    player_1_points: game.player_1.points,
    player_1_total: game.player_1.total,
    frame_number: game.player_1.frame_number,
    player_2_name: game.player_2.name,
    player_2_score: game.player_2.score,
    playeR_2_bonus: game.player_2.bonus,
    player_2_points: game.player_2.points,
    player_2_total: game.player_2.total,   
  }.to_json
  File.read('public/index.html')
  end 

  post '/names_post' do 

    session[:player_1_name] = params[:player_1_name]
    session[:player_2_name] = params[:player_2_name] 
    redirect '/'
  end
  
  
  run! if app_file == $0
end 