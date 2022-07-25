# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TransactionsController, type: :controller do
  let(:user) { create(:user) }
  let(:partner) { create(:user) }

  before do
    sign_in(user)
    allow(controller).to receive(:current_user).and_return(user)
    user.account.update!(amount: 10_000)
    partner.account.update!(amount: 10_000)
  end

  describe 'POST #create' do
    context 'with signed user' do
      it 'redirects to user transactions page' do
        post :create, params: { transaction: { amount: 10, email: partner.email } }
        expect(response).to redirect_to(transactions_path)
      end

      it 'changes the number of transactions' do
        expect do
          post :create, params: { transaction: { amount: 10, email: partner.email } }
        end.to change(Transaction, :count).by(1)
        expect(user.account.transactions.count).to eq(1)
        expect(partner.account.transactions.count).to eq(1)
      end
    end
  end

  describe 'POST #create' do
    context 'with unsigned user' do
      it 'changes the number of transactions' do
        sign_out(user)
        expect do
          post :create, params: { transaction: { amount: 10, email: partner.email } }
        end.to change(Transaction, :count).by(0)
        expect(user.account.transactions.count).to eq(0)
        expect(partner.account.transactions.count).to eq(0)
      end
    end
  end

  describe 'Get #index' do
    context 'with signed user' do
      before { post :create, params: { transaction: { amount: 10, email: partner.email } } }

      it 'returns correct number of transactions of current user' do
        get :index
        expect(subject.instance_variable_get(:@transactions).count).to eq(1)
      end
    end
  end

  describe 'Get #index' do
    context 'with unsigned user' do
      before { post :create, params: { transaction: { amount: 10, email: partner.email } } }

      it 'returns nil' do
        sign_out(user)
        get :index
        expect(subject.instance_variable_get(:@transactions)).to eq(nil)
      end
    end
  end
end
