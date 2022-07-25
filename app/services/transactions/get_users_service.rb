# frozen_string_literal: true

module Transactions
  class GetUsersService
    attr_reader :user

    def initialize(user)
      @user = user
    end

    def call
      user.account.transactions
    end
  end
end
