# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Transactions::CreateNewService do
  let(:user) { create(:user) }
  let(:partner) { create(:user) }

  before do
    user.account.update!(amount: 10_000)
    partner.account.update!(amount: 10_000)
  end

  describe '#call' do
    context 'with valid attributes' do
      it 'creates transactions for user' do
        user.account.amount = 1000
        partner.account.amount = 1000
        partner.account.save
        Transactions::CreateNewService.new(user, { 'amount' => 10, 'email' => partner.email }).call
        expect(partner.account.transactions.count).to eq(1)
      end

      it "don't perform transaction if amount greater than account money value" do
        Transactions::CreateNewService.new(user,
                                           { 'amount' => user.account.amount + 10,
                                             'email' => partner.email }).call
        expect(user.account.transactions.count).to eq(0)
        expect(partner.account.transactions.count).to eq(0)
      end
    end
  end
end
