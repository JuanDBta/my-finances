# frozen_string_literal: true

# Migration to create "admin' column.
class AddAdminToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :admin, :boolean, default: false
  end
end
