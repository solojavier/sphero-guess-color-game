require 'sinatra'
require_relative 'guess'

post '/color' do
  Guess.set_color params[:color].downcase

  redirect '/'
end

get '/' do
  erb :index
end
