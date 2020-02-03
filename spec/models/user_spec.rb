# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string
#  first_name      :string
#  last_name       :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    expect(
      User.new(
        email: 'user@example.com',
        first_name: 'John',
        last_name: 'Doe',
        password_digest: 'abc123'
      )
    ).to be_valid
  end
  it 'is not valid without an email' do
    expect(
      User.new(
        first_name: 'John',
        last_name: 'Doe',
        password_digest: 'abc123'
      )
    ).to_not be_valid
  end
  it 'is not valid without first_name' do
    expect(
      User.new(
        email: 'user@example.com',
        last_name: 'Doe',
        password_digest: 'abc123'
      )
    ).to_not be_valid
  end
  it 'is not valid without last_name ' do
    expect(
      User.new(
        email: 'user@example.com',
        first_name: 'John',
        password_digest: 'abc123'
      )
    ).to_not be_valid
  end
  it 'is not valid without pasword ' do
    expect(
      User.new(
        email: 'user@example.com',
        first_name: 'John',
        last_name: 'Doe'
      )
    ).to_not be_valid
  end
  it 'is not valid with a pasword shorter than 6 characters' do
    expect(
      User.new(
        email: 'user@example.com',
        first_name: 'John',
        last_name: 'Doe',
        password_digest: 'abc12'
      )
    ).to_not be_valid
  end
end
# rubocop:enable Metrics/BlockLength
