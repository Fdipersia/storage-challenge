# frozen_string_literal: true

class CreateGoods < ActiveRecord::Migration[5.2]
  def change
    create_table :goods do |t|
      t.string :name
      t.string :type
      t.string :source
      t.string :destination
      t.date :entry_at
      t.date :exit_at

      t.timestamps
    end
  end
end
