require 'artoo/robot'

class SpheroRobot < Artoo::Robot

  connection :sphero, :adaptor => :sphero, :port => '127.0.0.1:1234'
  device :sphero, :driver => :sphero
  api :host => '127.0.0.1', :port => '4321'

  name 'sphero'

end
