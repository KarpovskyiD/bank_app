require 'rails_helper'

RSpec.describe Transactions::GetUsersTransactionsService do
  let(:user) { create(:user) }

  describe '#call' do
    context 'with valid attributes' do
      it 'get all transactions of current user' do
        result = Transactions::GetUsersTransactionsService.new(user).call
        expect(result).to eq(user.transactions)
      end
    end
  end
end
