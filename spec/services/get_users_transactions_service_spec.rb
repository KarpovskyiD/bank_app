# frozen_string_literal: true

RSpec.describe Transactions::GetListService do
  let(:user) { create(:user) }

  describe '#call' do
    context 'with valid attributes' do
      it 'get all transactions of current user' do
        user.account.amount = 1000
        result = Transactions::GetListService.new(user).call
        expect(result).to eq(user.account.transactions)
      end
    end
  end
end
