# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :validatable
  has_one :account, dependent: :destroy
  has_many :sent_transactions, class_name: 'Transaction',
                               foreign_key: :sender_id,
                               inverse_of: :sender_bank_account,
                               dependent: :destroy

  has_many :received_transactions, class_name: 'Transaction',
                                   foreign_key: :receiver_id,
                                   inverse_of: :receiver_bank_account,
                                   dependent: :destroy

  after_create :create_account!
end
