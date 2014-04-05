# spec/spec_helper.rb
require 'rack/test'

require File.expand_path '../../app.rb', __FILE__

module RSpecMixin
  include Rack::Test::Methods

  def app()
    MyApp
  end
end

GAME = Game.new

RSpec.configure { |c| c.include RSpecMixin  }
