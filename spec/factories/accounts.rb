# frozen_string_literal: true

FactoryBot.define do
  factory :account do
    amount { 20_000 }

    association :user
  end
end
