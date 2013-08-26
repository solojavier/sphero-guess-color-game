class Guess

  def self.set_color(color)
    `touch #{color}`
  end

  def self.game_over?
    File.exists?('gameover')
  end

  def self.color?(color)
    File.exists?(color)
  end

  def self.end_game
    `touch gameover`
  end

end
