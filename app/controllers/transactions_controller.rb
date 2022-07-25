# frozen_string_literal: true

class TransactionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @transactions = Transactions::GetUsersService.new(current_user).call.map(&:decorate)
  end

  def create
    Transactions::CreateNewService.new(current_user, permitted_create_params).call

    redirect_to transactions_path, notice: 'Money were sent'
  end

  private

  def permitted_create_params
    params.require(:transaction).permit(:email, :amount)
  end
end
