# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'registration of user process', type: :feature do
  it 'adds a new user' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'email', with: 'testtest@gmail.com'
    fill_in 'password', with: '12345678'
    click_on 'Register'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end

  it 'shows an error when incorrect email' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'email', with: 'te'
    fill_in 'password', with: '12345678'
    click_on 'Register'
    expect(page).to have_content 'Email is invalid'
  end

  it 'shows an error when incorrect password' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'email', with: 'testtest@gmail.com'
    fill_in 'password', with: '1'
    click_on 'Register'
    expect(page).to have_content 'Password is too short (minimum is 6 characters)'
  end
end
