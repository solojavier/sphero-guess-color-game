require 'sinatra/base'
require_relative 'game'

class MyApp < Sinatra::Base

  post '/color' do
    if GAME.over?
      redirect '/end'
    else
      GAME.guess_color(params[:color].downcase)
      redirect '/'
    end
  end

  get '/' do
    erb :index
  end

  get '/end' do
    erb :end
  end

end
