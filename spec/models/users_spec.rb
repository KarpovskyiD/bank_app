# frozen_string_literal: true

RSpec.describe User, type: :model do
  let(:user) { create :user }

  describe 'columns' do
    it { is_expected.to have_db_column(:email) }
    it { is_expected.to have_db_column(:encrypted_password) }
    it { is_expected.to have_db_column(:remember_created_at) }
  end

  context 'check relations' do
    it { is_expected.to have_one(:account).dependent(:destroy) }
  end
end
