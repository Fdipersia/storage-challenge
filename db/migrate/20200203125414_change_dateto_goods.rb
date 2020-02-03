# frozen_string_literal: true

class ChangeDatetoGoods < ActiveRecord::Migration[5.2]
  def change
    remove_column :goods, :entry_at
    remove_column :goods, :exit_at
    add_column :goods, :entry_at, :datetime
    add_column :goods, :exit_at, :datetime
  end
end
