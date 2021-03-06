# frozen_string_literal: true

# == Schema Information
#
# Table name: goods
#
#  id             :bigint           not null, primary key
#  category       :string
#  destination    :string
#  entry_at       :datetime
#  exit_at        :datetime
#  name           :string
#  source         :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  consignment_id :string
#

class Good < ApplicationRecord
  require 'csv'

  validates :name, :category, :source, :destination, :consignment_id, presence: true
  validates :consignment_id, uniqueness: true
  validates :entry_at, presence: true, if: -> { exit_at.blank? }
  validates :exit_at, presence: true, if: -> { entry_at.blank? }
  validate  :exit_at, :cannot_be_smaller_than_entry_at, if: -> { entry_at && exit_at }

  scope :type, ->(type) { where('category ILIKE ?', type) }
  scope :arrive_by, ->(arrival_date) { where("date_trunc('day', entry_at) = ?", arrival_date) }

  def cannot_be_smaller_than_entry_at
    errors.add(:exit_at, 'Can not be smaller than entry date') if exit_at < entry_at
  end

  def self.import(file)
    processed_goods = { saved: [], not_saved: [] }
    csv_options = { encoding: 'UTF-8', headers: true, header_converters: :symbol }
    CSV.foreach(file.path, csv_options) do |row|
      good = Good.find_by(consignment_id: row[:consignment_id])
      if good
        exit_at = row[:exit_at] || Time.now
        good.exit_at = exit_at.to_time
      else
        good = Good.new
        good.consignment_id = row[:consignment_id]
        good.category = row[:type]
        good.destination = row[:destination]
        good.entry_at = row[:entry_at]
        good.exit_at = row[:entry_at]
        good.name = row[:name]
        good.source = row[:source]
      end
      good.save ? processed_goods[:saved] << good : processed_goods[:not_saved] << good
    end
    processed_goods
  end
end
