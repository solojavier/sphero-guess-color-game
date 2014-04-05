require 'spec_helper'

describe 'color' do

  context 'game is not over' do

    before do
      GAME.stub(:over?).and_return(false)
      GAME.stub(:guess_color)
    end

    subject! { post '/color', color: 'red' }

    it 'guesses game color' do
       expect(GAME).to have_received(:guess_color).with('red')
    end

    it 'redirects to index' do
      expect(last_response).to be_redirect
      expect(last_response.location).to eq('http://example.org/')
    end

  end

  context 'game is over' do

    before do
      GAME.stub(:over?).and_return(true)
    end

    it 'redirects to index' do
      post '/color'

      expect(last_response).to be_redirect
      expect(last_response.location).to eq('http://example.org/end')
    end

  end
end
