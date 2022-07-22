# frozen_string_literal: true

FactoryBot.define do
  factory :transaction do
    cached_amount { 10000 }
    amount { 10 }
    partner { FFaker::Internet.email }
  end
end
