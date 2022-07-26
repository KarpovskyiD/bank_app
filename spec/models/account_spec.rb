# frozen_string_literal: true

RSpec.describe Account do
  describe 'indexes' do
    it { is_expected.to have_db_index(:user_id) }
  end

  describe 'relations' do
    it { is_expected.to belong_to(:user) }
  end
end
