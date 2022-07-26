module Transactions
  class CreateForm
    include ActiveModel::Model

    attr_accessor :email, :amount, :active_user, :receiver

    validates :email, presence: true
    validates :email, format: Devise.email_regexp
    validates :amount, presence: true
    validates :amount, numericality: { only_integer: true, greater_than: 0 }
    validate :user_has_enough_money
    validate :receiver_present

    private

    def user_has_enough_money
      user = User.find_by(email: active_user)
      return if user.account.amount - amount.to_i >= 0

      errors.add(:amount, I18n.t('forms.errors.not_enough_money'))
    end

    def receiver_present
      user = User.find_by(email: receiver)
      return if user.present?

      errors.add(:receiver, I18n.t('forms.errors.receiver_not_exists'))
    end
  end
end
