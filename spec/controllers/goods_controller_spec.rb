# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe GoodsController, type: :controller do
  context 'before creation' do
    it 'must have name' do
      expect do
        Good.create!(
          category: 'Food',
          source: 'Australia/Sydney',
          destination: 'Australia/Perth',
          entry_at: '2020-02-03 02:29:06'
        )
      end.to raise_error(ActiveRecord::RecordInvalid)
    end
    it 'must have category' do
      expect do
        Good.create!(
          name: 'Coconuts',
          source: 'Australia/Sydney',
          destination: 'Australia/Perth',
          entry_at: '2020-02-03 02:29:06'
        )
      end.to raise_error(ActiveRecord::RecordInvalid)
    end
    it 'must have source' do
      expect do
        Good.create!(
          name: 'Coconuts',
          category: 'Food',
          destination: 'Australia/Perth',
          entry_at: '2020-02-03 02:29:06'
        )
      end.to raise_error(ActiveRecord::RecordInvalid)
    end
    it 'must have destination' do
      expect do
        Good.create!(
          name: 'Coconuts',
          category: 'Food',
          source: 'Australia/Sydney',
          entry_at: '2020-02-03 02:29:06'
        )
      end.to raise_error(ActiveRecord::RecordInvalid)
    end
    it 'must have entry_at or exit_at' do
      expect do
        Good.create!(
          name: 'Coconuts',
          category: 'Food',
          source: 'Australia/Sydney',
          destination: 'Australia/Perth'
        )
      end.to raise_error(ActiveRecord::RecordInvalid)
    end
    it 'entry_at can not be bigger than exit_at' do
      expect do
        Good.create!(
          name: 'Coconuts',
          category: 'Food',
          source: 'Australia/Sydney',
          destination: 'Australia/Perth',
          entry_at: '2020-02-03 02:29:06',
          exit_at: '2019-02-03 02:29:06'
        )
      end.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
  # rubocop:enable Metrics/BlockLength
end
