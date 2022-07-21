module Transactions
  class CreateNewTransactionService
    attr_reader :user, :params

    def initialize(user, params)
      @user = user
      @params = params
    end

    def call
      amount = params["amount"].to_i
      partner = User.find_by(email: params["email"])
      if partner.present? && expected_amount_positive?(amount)
        create_transaction(user, -amount, partner)
        create_transaction(partner, amount, user)
      end
    end

    private

    def expected_amount_positive?(amount)
      (user.account.amount - amount).positive?
    end

    def create_transaction(user, amount, partner)
      ActiveRecord::Base.transaction do
        transaction = Transaction.create(cached_amount: user.account.amount, amount: amount, partner: partner.email)
        user.transactions << transaction
        user.account.amount += amount
        user.save!
        user.account.save!
      end
    end
  end
end
