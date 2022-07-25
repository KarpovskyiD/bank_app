# frozen_string_literal: true

FactoryBot.define do
  factory :transaction do
    amount { 30 }
    cached_sender_amount { 10_000 }
    cached_receiver_amount { 10_000 }
    association :sender_bank_account, factory: :account
    association :receiver_bank_account, factory: :account
  end
end
