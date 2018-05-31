require 'rails_helper'

describe 'Visit home' do
  it 'is successful' do
    visit '/'

    expect(page).to have_content('WhatTheShift')
  end
end
