require 'rails_helper'

RSpec.describe Transactions::CreateNewTransactionService do
  let(:user) { create(:user) }
  let(:partner) { create(:user) }


  describe '#call' do
    context 'with valid attributes' do

      it 'creates transactions for user' do
        Transactions::CreateNewTransactionService.new(user, { "amount" => 10, "email" => partner.email } ).call
        expect(partner.transactions.count).to eq(1)
      end

      it "don't perform transaction if amount greater than account money value" do
        Transactions::CreateNewTransactionService.new(user, { "amount" => user.account.amount + 10, "email" => partner.email } ).call
        expect(user.transactions.count).to eq(0)
        expect(partner.transactions.count).to eq(0)
      end
    end
  end
end
