require 'spec_helper'

describe User do
  it 'has picks' do
    user = User.create

    expect(user.picks).to be_empty
  end
end
