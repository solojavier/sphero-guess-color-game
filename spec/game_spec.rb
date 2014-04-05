require_relative '../game'

describe Game do

  it 'contains game colors' do
    expect(Game::COLORS).to_not be_empty
  end

  context 'when color is guessed' do

    let(:next_color) { Game::COLORS[1]  }

    before do
      subject.stub(:change_sphero_color)
      subject.guess_color(Game::COLORS.first)
    end
    
    it 'increments current color' do
      expect(subject.current_color).to eq(next_color)
    end

    it 'changes sphero color' do
      expect(subject).to have_received(:change_sphero_color).with(next_color)
    end
  end

  context 'when all colors are guessed' do

    before do
      Game::COLORS.each do |color|
        subject.guess_color(color)
      end
    end

    it 'game is over' do
      expect(subject.over?).to eq(true)
      expect(subject.current_color).to eq(Game::COLORS.last)
    end

  end

end
