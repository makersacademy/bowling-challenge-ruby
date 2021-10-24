require "sinatra/base"
require "sinatra/reloader"

require './lib/frame.rb'

class Bowling < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  before do
    @frame = Frame.instance
  end

  get "/" do
    @frame = Frame.create
    erb(:index)
  end

  get '/result' do
    @choice = params[:player_1_choice]
    @bowl = @frame.bowl(@choice.to_i)
    
  erb (:result)

  end

  run! if app_file == $0
end