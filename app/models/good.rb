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

class Good < ApplicationRecord
  validates :name, presence: true
  validates :category, presence: true
  validates :source, presence: true
  validates :destination, presence: true
  validates :entry_at, presence: true, if: -> { exit_at.blank? }
  validates :exit_at, presence: true, if: -> { entry_at.blank? }
  validate  :exit_at, :cannot_be_smaller_than_entry_at, if: -> { entry_at && exit_at }

  def cannot_be_smaller_than_entry_at
    errors.add(:exit_at, "Can't be smaller than entry date") if exit_at < entry_at
  end
end
