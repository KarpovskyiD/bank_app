# frozen_string_literal: true

class TransactionsController < ApplicationController
  def index
    @transactions = Transactions::GetUsersTransactionsService.new(current_user).call
  end

  def create
    Transactions::CreateNewTransactionService.new(current_user, params["transaction"]).call

    redirect_to transactions_path
  end
end
