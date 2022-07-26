# frozen_string_literal: true

class TransactionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @transactions = TransactionDecorator.decorate_collection(Transactions::GetListService.new(current_user).call)
  end

  def create
    form = ::Transactions::CreateForm.new(form_params)
    if form.valid?
      Transactions::CreateNewService.new(current_user, permitted_create_params).call
      redirect_to transactions_path, notice: t('forms.money_sent')
    else
      redirect_to new_transaction_path, alert: form.errors.messages
    end
  end

  private

  def permitted_create_params
    params.require(:transaction).permit(:email, :amount)
  end

  def form_params
    params["transaction"].merge!(active_user: current_user.email, receiver: params["transaction"]["email"])
    params.require(:transaction).permit(:email, :amount, :active_user, :receiver)
  end
end
