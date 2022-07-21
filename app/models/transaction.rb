# frozen_string_literal: true

class Transaction < ApplicationRecord
  belongs_to :user, class_name: 'User', optional: true
end
