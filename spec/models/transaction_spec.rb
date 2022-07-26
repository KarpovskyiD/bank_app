# frozen_string_literal: true

RSpec.describe Transaction do
  describe 'columns' do
    it { is_expected.to have_db_column(:amount) }
    it { is_expected.to have_db_column(:cached_sender_amount) }
    it { is_expected.to have_db_column(:cached_receiver_amount) }
  end

  describe 'relations' do
    it { is_expected.to belong_to(:sender_bank_account).class_name('Account') }
    it { is_expected.to belong_to(:receiver_bank_account).class_name('Account') }
  end
end
