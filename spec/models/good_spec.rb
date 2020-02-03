# frozen_string_literal: true

# == Schema Information
#
# Table name: goods
#
#  id          :bigint           not null, primary key
#  category    :string
#  destination :string
#  entry_at    :date
#  exit_at     :date
#  name        :string
#  source      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe Good, type: :model do
  it 'is valid with valid attributes' do
    expect(
      Good.new(
        name: 'Coconuts',
        category: 'Food',
        source: 'Australia/Sydney',
        destination: 'Australia/Perth',
        entry_at: '2019-02-03 02:29:06',
        exit_at: '2020-02-03 02:29:06'
      )
    ).to be_valid
  end
  it 'is not valid without name' do
    expect(
      Good.new(
        category: 'Food',
        source: 'Australia/Sydney',
        destination: 'Australia/Perth',
        entry_at: '2020-02-03 02:29:06'
      )
    ).not_to be_valid
  end
  it 'is not valid without category' do
    expect(
      Good.new(
        name: 'Coconuts',
        source: 'Australia/Sydney',
        destination: 'Australia/Perth',
        entry_at: '2020-02-03 02:29:06'
      )
    ).not_to be_valid
  end
  it 'is not valid without source' do
    expect(
      Good.new(
        name: 'Coconuts',
        category: 'Food',
        destination: 'Australia/Perth',
        entry_at: '2020-02-03 02:29:06'
      )
    ).not_to be_valid
  end
  it 'is not valid without destination' do
    expect(
      Good.new(
        name: 'Coconuts',
        category: 'Food',
        source: 'Australia/Sydney',
        entry_at: '2020-02-03 02:29:06'
      )
    ).not_to be_valid
  end
  it 'is not valid without entry_at or exit_at' do
    expect(
      Good.new(
        name: 'Coconuts',
        category: 'Food',
        source: 'Australia/Sydney',
        destination: 'Australia/Perth'
      )
    ).not_to be_valid
  end
  it 'is not valid if entry_at is bigger than exit_at' do
    expect(
      Good.new(
        name: 'Coconuts',
        category: 'Food',
        source: 'Australia/Sydney',
        destination: 'Australia/Perth',
        entry_at: '2020-02-03 02:29:06',
        exit_at: '2019-02-03 02:29:06'
      )
    ).not_to be_valid
  end
end
# rubocop:enable Metrics/BlockLength
