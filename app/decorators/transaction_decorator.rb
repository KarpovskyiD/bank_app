# frozen_string_literal: true

class TransactionDecorator < Draper::Decorator
  delegate_all

  def cached_balance
    user_is_sender? ? cached_sender_amount : cached_receiver_amount
  end

  def partner_email
    user_is_sender? ? receiver_bank_account.user.email : sender_bank_account.user.email
  end

  def transaction_amount
    sign = user_is_sender? ? '-' : '+'
    sign + amount.to_s
  end

  private

  def user_is_sender?
    sender_bank_account.user == h.current_user
  end
end
