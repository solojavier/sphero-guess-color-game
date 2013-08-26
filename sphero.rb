require 'artoo'
require_relative 'guess'

connection :sphero, :adaptor => :sphero, :port => '127.0.0.1:8023'
device :sphero, :driver => :sphero

work do
  colors  = [:blue, :green, :yellow, :white]
  current = 0
  sphero.set_color(colors.first)

  every(3.seconds) do
    unless Guess.game_over?
      if Guess.color?(colors[current].to_s)
        if current == colors.size-1
          Guess.end_game
        else
          current+=1
          sphero.set_color(colors[current])
        end
      end
    end
  end
end
