# frozen_string_literal: true

require 'sinatra'


class BowlingScoreboard < Sinatra::Base
  enable :sessions, :method_override


  get '/' do
    erb(:index)
  end

end