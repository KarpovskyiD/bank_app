# frozen_string_literal: true

require 'spec_helper'

RSpec.describe TransactionDecorator, type: :decorator do
  subject(:transaction) do
    create(:transaction,
           receiver_bank_account: receiver.account,
           sender_bank_account: sender.account,
           amount: 100).decorate
  end
  let(:receiver) { create(:user) }
  let(:sender) { create(:user) }

  describe '#partner_email' do
    it 'returns receiver email if current user is sender' do
      allow(transaction.h).to receive(:current_user) { sender }
      expect(transaction.partner_email).to eq(receiver.email)
    end

    it 'returns sender email if current user is receiver' do
      allow(transaction.h).to receive(:current_user) { receiver }
      expect(transaction.partner_email).to eq(sender.email)
    end
  end

  describe '#amount' do
    it 'returns + with a amount in usd if current user is receiver' do
      allow(transaction.h).to receive(:current_user) { sender }
      expect(transaction.transaction_amount).to eq('-100')
    end

    it 'returns + with a balance in usd if current user is receiver' do
      allow(transaction.h).to receive(:current_user) { receiver }
      expect(transaction.transaction_amount).to eq('+100')
    end
  end

  describe '#cached_balance' do
    it 'returns sender balance in usd if current user is sender' do
      allow(transaction.h).to receive(:current_user).and_return(sender)
      expect(transaction.cached_balance).to eq(10_000)
    end

    it 'returns receiver balance in usd if current user is receiver' do
      allow(transaction.h).to receive(:current_user).and_return(receiver)
      expect(transaction.cached_balance).to eq(10_000)
    end
  end
end
