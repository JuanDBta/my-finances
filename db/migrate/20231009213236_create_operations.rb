# frozen_string_literal: true

# Migration to create the 'operations' table.
class CreateOperations < ActiveRecord::Migration[7.0]
  def change
    create_table :operations do |t|
      t.string :name, null: false
      t.decimal :amount, precision: 10, scale: 2, default: 0.00
      t.references :category, null: false, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
