module Transactions
  class CreateForm
    include ActiveModel::Model

    attr_accessor :email, :amount

    validates :email, presence: true
    validates :email, format: Devise.email_regexp
    validates :amount, presence: true
    validates :amount, numericality: { only_integer: true, greater_than: 0 }
  end
end
