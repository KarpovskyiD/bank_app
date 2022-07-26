# frozen_string_literal: true

module Transactions
  class CreateNewService
    attr_reader :user, :params, :receiver, :amount

    def initialize(user, params)
      @user = user
      @params = params
      @amount = params['amount'].to_i
      @receiver = User.find_by(email: params['email'])
    end

    def call
      return unless receiver.present? && expected_amount_positive?(amount)

      execute_db_transaction
    end

    private

    def expected_amount_positive?(amount)
      (user.account.amount - amount).positive?
    end

    def execute_db_transaction
      ActiveRecord::Base.transaction do
        generate_account_transaction
        update_accounts
      end
    end

    def generate_account_transaction
      Transaction.create(
        amount: amount,
        receiver_bank_account: receiver.account,
        sender_bank_account: user.account,
        cached_sender_amount: initial_amount(user),
        cached_receiver_amount: initial_amount(receiver)
      ).save
    end

    def initial_amount(user)
      user.account.amount
    end

    def receiver_new_amount
      receiver.account.amount + amount
    end

    def sender_new_amount
      user.account.amount - amount
    end

    def update_accounts
      receiver.account.update!(amount: receiver_new_amount)
      user.account.update!(amount: sender_new_amount)
    end
  end
end
