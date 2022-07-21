# frozen_string_literal: true

class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.integer :cached_amount
      t.integer :amount
      t.string :partner
      t.timestamps
    end

    add_reference :transactions, :user, index: true
  end
end
