require 'spec_helper'

describe 'index' do

  it 'shows index' do
    get '/'

    expect(last_response).to be_ok
  end

end
