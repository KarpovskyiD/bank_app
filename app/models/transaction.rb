# frozen_string_literal: true

class Transaction < ApplicationRecord
  belongs_to :sender_bank_account, class_name: 'Account', inverse_of: :sent_transactions
  belongs_to :receiver_bank_account, class_name: 'Account', inverse_of: :received_transactions
end
