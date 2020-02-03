# frozen_string_literal: true

class AddConsignmentIdToGoods < ActiveRecord::Migration[5.2]
  def change
    add_column :goods, :consignment_id, :string
  end
end
