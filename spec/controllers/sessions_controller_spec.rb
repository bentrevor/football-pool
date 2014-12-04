require 'spec_helper'

describe SessionsController do
  it 'creates sessions when people log in' do
    post :create, login_name: 'asdf'

    expect(session[:current_user_name]).to eq 'asdf'
  end

  it 'can destroy a session' do
    post :create, login_name: 'asdf'

    post :destroy, login_name: 'asdf'
    expect(session[:current_user_name]).to be nil

    post :destroy, login_name: 'asdf'
    expect(session[:current_user_name]).to be nil
  end
end
