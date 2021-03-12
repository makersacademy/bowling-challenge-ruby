require './lib/game'
require 'sinatra/base'
require 'json'


class Bowling_scores_app < Sinatra::Base

  get '/' do 
    File.read('public/index.html')
  end 


  run! if app_file == $0
end 