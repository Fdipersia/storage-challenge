# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GoodsController, type: :controller do
  describe 'GET index' do
    it 'shows goods index if user is logged in' do
      user = User.create!(first_name: 'Tester',
                          last_name: 'Developer',
                          email: 'tester@example.com',
                          password: 'abc123',
                          password_confirmation: 'abc123')
      session[:user_id] = user.id
      get 'index'
      assert_response :success
    end
    it 'does not show goods index if user not logged in' do
      get 'index'
      assert_response :redirect
    end
  end
end
