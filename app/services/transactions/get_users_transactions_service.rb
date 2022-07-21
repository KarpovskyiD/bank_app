# frozen_string_literal: true

module Transactions
  class GetUsersTransactionsService
    attr_reader :user

    def initialize(user)
      @user = user
    end

    def call
      user.transactions
    end
  end
end
