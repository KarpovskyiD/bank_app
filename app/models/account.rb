# frozen_string_literal: true

class Account < ApplicationRecord
  belongs_to :user, class_name: 'User'

  has_many :sent_transactions, class_name: 'Transaction',
                               foreign_key: :sender_bank_account_id,
                               inverse_of: :sender_bank_account,
                               dependent: :destroy

  has_many :received_transactions, class_name: 'Transaction',
                                   foreign_key: :receiver_bank_account_id,
                                   inverse_of: :receiver_bank_account,
                                   dependent: :destroy

  def transactions
    sent_transactions.or(received_transactions).order(created_at: :desc)
  end
end
