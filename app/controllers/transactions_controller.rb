# frozen_string_literal: true

class TransactionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @transactions = TransactionDecorator.decorate_collection(Transactions::GetListService.new(current_user).call)
  end

  def create
    form = ::Transactions::CreateForm.new(permitted_create_params)
    if form.valid?
      Transactions::CreateNewService.new(current_user, permitted_create_params).call
      redirect_to transactions_path, notice: 'Money were sent'
    else
      redirect_to new_transaction_path, alert: 'Transaction data is incorrect. Please check'
    end
  end

  private

  def permitted_create_params
    params.require(:transaction).permit(:email, :amount)
  end
end
