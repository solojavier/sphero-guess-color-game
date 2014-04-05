require './app'
require './sphero'

fork { SpheroRobot.work! }
sleep 5 #While sphero initializes

GAME = Game.new
run MyApp
