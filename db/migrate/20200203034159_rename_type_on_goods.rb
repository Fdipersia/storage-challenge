# frozen_string_literal: true

class RenameTypeOnGoods < ActiveRecord::Migration[5.2]
  def change
    remove_column :goods, :type
    add_column :goods, :category, :string
  end
end
