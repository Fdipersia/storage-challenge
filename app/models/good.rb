# frozen_string_literal: true

# == Schema Information
#
# Table name: goods
#
#  id          :bigint           not null, primary key
#  destination :string
#  entry_at    :date
#  exit_at     :date
#  name        :string
#  source      :string
#  type        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Good < ApplicationRecord
end
