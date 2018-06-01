require 'features_helper'

describe 'Visit home', :js do
  it 'is successful' do
    visit '/'

    expect(page).to have_content('WhatTheShift')
    observe!('Homepage')
  end
end
