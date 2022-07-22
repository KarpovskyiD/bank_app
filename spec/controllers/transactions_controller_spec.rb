require 'rails_helper'

RSpec.describe TransactionsController, type: :controller do
  let(:user) { create(:user) }
  let(:partner) {create(:user)}

  before { allow(controller).to receive(:current_user).and_return(user) }

  describe 'POST #create' do
    context 'with valid attributes' do

      it 'redirects to user transactions page' do
        post :create, params: { transaction: { amount: 10, email: partner.email } }
        expect(response).to redirect_to(transactions_path)
      end

      it 'changes the number of transactions' do
        expect { post :create, params: { transaction: { amount: 10, email: partner.email } } }.to change(Transaction, :count).by(2)
        expect(user.transactions.count).to eq(1)
        expect(partner.transactions.count).to eq(1)
      end
    end
  end

  describe 'POST #index' do
    context 'with valid attributes' do
      before { post :create, params: { transaction: { amount: 10, email: partner.email } } }

      it 'returns correct number of transactions of current user' do
        get :index 
        expect(subject.instance_variable_get(:@transactions).count).to eq(1)
      end

      it 'changes the number of accounts' do
        expect { post :create, params: { transaction: { amount: 10, email: partner.email } } }.to change(Transaction, :count).by(2)
      end
    end
  end
end
