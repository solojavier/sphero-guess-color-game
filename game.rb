require 'rest_client'
require 'sphero'

class Game

  COLORS = ['blue', 'green', 'yellow', 'white']

  def initialize
    @current = 0
    change_sphero_color(current_color)
  end

  def guess_color(color)
    if color == current_color
      unless over?
        @current += 1
        change_sphero_color(current_color)
      end
    end
  end

  def current_color
    COLORS[@current]
  end

  def over?
    COLORS.size <= @current+1
  end

  private

  def change_sphero_color(color)
    rgb = ::Sphero::COLORS[color]
    RestClient.post(sphero_url,
                    "{\"r\": #{rgb[:r]}, \"g\": #{rgb[:g]} , \"b\": #{rgb[:b]}}")
  end

  def sphero_url
    'http://localhost:4321/robots/sphero/devices/sphero/commands/set_color'
  end

end
