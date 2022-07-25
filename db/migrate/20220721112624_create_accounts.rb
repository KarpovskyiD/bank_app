# frozen_string_literal: true

class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.integer :amount
      t.belongs_to :user, index: true, unique: true, null: false, foreign_key: true
      t.timestamps
    end
  end
end
