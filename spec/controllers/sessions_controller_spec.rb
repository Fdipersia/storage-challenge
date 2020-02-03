# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe SessionsController, type: :controller do
  describe 'POST create' do
    it 'creates a new session' do
      user = User.create!(first_name: 'Tester',
                          last_name: 'Developer',
                          email: 'tester@example.com',
                          password: 'abc123',
                          password_confirmation: 'abc123')
      post 'create', params: { email: user.email, password: user.password }
      assert session[:user_id] == user.id
    end
    it 'does not creates a new session if password is not correct' do
      user = User.create!(first_name: 'Tester',
                          last_name: 'Developer',
                          email: 'tester@example.com',
                          password: 'abc123',
                          password_confirmation: 'abc123')
      post 'create', params: { email: user.email, password: 'cba321' }
      assert session[:user_id].nil?
    end
  end
  describe 'GET destroy' do
    it 'destroys the session' do
      user = User.create!(first_name: 'Tester',
                          last_name: 'Developer',
                          email: 'tester@example.com',
                          password: 'abc123',
                          password_confirmation: 'abc123')
      post 'create', params: { email: user.email, password: user.password }
      get 'destroy'
      assert session[:user_id].nil?
    end
  end
end
# rubocop:enable Metrics/BlockLength
