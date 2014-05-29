require 'artoo/robot'

class SpheroRobot < Artoo::Robot

  connection :sphero, :adaptor => :sphero, :port => '/dev/tty.Sphero-YBW-RN-SPP'
  device :sphero, :driver => :sphero
  api :host => '127.0.0.1', :port => '4321'

  name 'sphero'

end
