# frozen_string_literal: true

class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.integer :cached_sender_amount
      t.integer :cached_receiver_amount
      t.integer :amount
      t.belongs_to :sender_bank_account, class_name: 'Account', null: false, index: true,
                                         foreign_key: { to_table: :accounts }
      t.belongs_to :receiver_bank_account, class_name: 'Account', null: false, index: true,
                                           foreign_key: { to_table: :accounts }
      t.timestamps
    end
  end
end
