# frozen_string_literal: true

class Account < ApplicationRecord
  belongs_to :user, class_name: "User", optional: true
end
