require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create :user }

  context 'check relations' do
    it 'has many transactions' do
      expect(subject).to have_many(:transactions)
    end

    it 'has one accounts' do
      expect(subject).to have_one(:account)
    end
  end
end
