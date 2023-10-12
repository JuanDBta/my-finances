# frozen_string_literal: true

# Migration to create the 'users' table.
class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
